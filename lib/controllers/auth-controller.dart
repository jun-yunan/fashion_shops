import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shops/models/user-model.dart';
import 'package:fashion_shops/screens/home/home-screen.dart';
import 'package:fashion_shops/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final auth = Rx<FirebaseAuth>(FirebaseAuth.instance);
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final user = Rx<User?>(null);

  final userModel = Rx<UserModel?>(null);

  final isLogged = Rx<bool>(false);

  final isShowPassword = Rx<bool>(false);

  final emailController = Rx<TextEditingController>(TextEditingController());
  final passwordController = Rx<TextEditingController>(TextEditingController());
  final nameController = Rx<TextEditingController>(TextEditingController());
  final fakeVar = Rx<String>("");

  @override
  void onInit() {
    // TODO: implement onInit
    user.value = auth.value.currentUser;

    auth.value.authStateChanges().listen((User? currentUser) {
      user.value = currentUser;
      if (currentUser == null) {
        //log out
        setIsLogout();
      } else {
        // logged
        setIsLogged();
      }
    });
    super.onInit();
  }

  void setShowPassword() {
    isShowPassword.value = !isShowPassword.value;
    update();
  }

  void setIsLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLogged', true);
    isLogged.value = true;
    update();
  }

  void setIsLogout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLogged', false);
    isLogged.value = false;
    update();
  }

  void resetForm() {
    emailController.value.text = '';
    passwordController.value.text = '';
    nameController.value.text = "";
  }

  void checkIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isLogged') == true) {
      isLogged.value = true;
    } else {
      isLogged.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn().signIn().catchError((onError) => print(onError));

    if (googleUser != null) {
      try {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final User userDetails =
            (await auth.value.signInWithCredential(credential)).user!;

        if (await checkUserExists(userDetails.uid)) {
          /// next home page
          setIsLogged();
          Future.delayed(const Duration(milliseconds: 500), () {
            Get.offNamedUntil('/home', (route) => false);
          });
        } else {
          // create profile user
          userModel.value = UserModel(
            id: userDetails.uid,
            name: userDetails.displayName!,
            email: userDetails.email!,
            avatarUrl: userDetails.photoURL!,
            bio: "",
            birthday: "",
            gender: "",
            addresss: "",
            numberPhone: "",
            provider: "GOOGLE",
            createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
            updatedAt: DateTime.now().millisecondsSinceEpoch.toString(),
          );

          await firebaseFirestore
              .collection("users")
              .doc(userDetails.uid)
              .set(
                userModel.toJson(),
              )
              .then((value) {
            setIsLogged();
            Future.delayed(const Duration(milliseconds: 500),
                () => Get.offNamedUntil('/home', (route) => false));
          });
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "account-exists-with-different-credential") {
          showSnackbar(
            message:
                "You already have an account with us. Use correct provider",
            style: SnackBarStyle.error,
          );
        } else if (e.code == "null") {
          showSnackbar(
              message: "Some unexpected error while trying to sign in");
        } else {
          showSnackbar(
              message: "Some unexpected error while trying to sign in");
        }
        print(e);
      }
    } else {
      return showSnackbar(
          message: "Some unexpected error while trying to sign in");
    }
  }

  Future<bool> checkUserExists(uid) async {
    DocumentSnapshot documentSnapshot =
        await firebaseFirestore.collection('user').doc(uid).get();

    if (documentSnapshot.exists) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required BuildContext context,
    required String name,
  }) async {
    try {
      final credential = await auth.value
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        userModel.value = UserModel(
          id: value.user!.uid,
          name: name,
          email: email,
          avatarUrl: "",
          bio: "",
          birthday: "",
          gender: "",
          addresss: "",
          numberPhone: "",
          provider: "EMAIL",
          createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
          updatedAt: DateTime.now().millisecondsSinceEpoch.toString(),
        );
        await firebaseFirestore
            .collection('users')
            .doc(value.user!.uid)
            .set(userModel.toJson())
            .then((value) {
          showSnackbar(
            message: "Register Successfully!",
            style: SnackBarStyle.success,
          );
          setIsLogged();
          resetForm();
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false);
          });
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        showSnackbar(message: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showSnackbar(message: "The account already exists for that email.");
      }
    } catch (e) {
      print(e);
      showSnackbar(message: e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await auth.value
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        setIsLogged();
        resetForm();
        showSnackbar(
          message: "Login Successfully!",
          style: SnackBarStyle.success,
        );
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        showSnackbar(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        showSnackbar(message: 'Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
      showSnackbar(message: e.toString());
      showSnackbar(message: "Something went wrong!");
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await auth.value.sendPasswordResetEmail(email: email).then((value) {
        emailController.value.text = "";
        showSnackbar(
            message:
                "Email sent successfully. Please check your email in your inbox!",
            style: SnackBarStyle.success);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(message: "No user found for that email.");
      }
    }
  }

  bool isSignInWithGoogle() {
    final user = auth.value.currentUser;
    return user != null &&
        user.providerData
            .any((userInfo) => userInfo.providerId == 'google.com');
  }

  Future<void> handleLogOut() async {
    try {
      if (isSignInWithGoogle()) {
        await googleSignIn.signOut().then((value) {
          setIsLogout();
          Future.delayed(const Duration(milliseconds: 500), () {
            showSnackbar(
                message: "Logout account successfully!",
                style: SnackBarStyle.success);
            Get.offAndToNamed('/auth/login');
          });
        });
      } else {
        await auth.value.signOut().then((value) {
          setIsLogout();
          Future.delayed(const Duration(milliseconds: 500), () {
            showSnackbar(
                message: "Logout account successfully!",
                style: SnackBarStyle.success);
            Get.offAndToNamed('/auth/login');
          });
        });
      }
    } catch (e) {
      showSnackbar(message: e.toString());
      setIsLogout();
    }
  }

  Future<void> handleButtonRegister(
      {required String email,
      required String password,
      required String name}) async {
    try {} catch (e) {
      showSnackbar(message: e.toString());
      print(e.toString());
    }
  }
}
