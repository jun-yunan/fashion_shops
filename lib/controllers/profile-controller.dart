import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shops/models/user-model.dart';
import 'package:fashion_shops/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final user = Rx<UserModel?>(null);

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance;

  final DatabaseReference userRef =
      FirebaseDatabase.instance.ref("posts/12345");

  final nameController = Rx<TextEditingController>(TextEditingController());
  final emailController = Rx<TextEditingController>(TextEditingController());
  final addressController = Rx<TextEditingController>(TextEditingController());
  final numberPhoneController =
      Rx<TextEditingController>(TextEditingController());
  final genderController = Rx<TextEditingController>(TextEditingController());
  final birthdayController = Rx<TextEditingController>(TextEditingController());

  final gender = Rx<String>("male");

  void setGender(newValue) {
    gender.value = newValue;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInitUser();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> updateProfile() async {
    try {
      await _firebaseFirestore
          .collection("users")
          .doc(_firebaseAuth.currentUser!.uid)
          .update({
        "name": nameController.value.text,
        "address": addressController.value.text,
        "gender": gender.value,
        "birthday": birthdayController.value.text,
        "phoneNumber": numberPhoneController.value.text,
      });
      showSnackbar(
          message: "Profile updated successfully",
          style: SnackBarStyle.success);
    } catch (e) {
      print(e.toString());
      showSnackbar(message: "Failed to update profile");
    }
  }

  Future<void> getInitUser() async {
    try {
      if (_firebaseAuth.currentUser != null) {
        print("id: ${_firebaseAuth.currentUser!.uid}");
        final DocumentSnapshot documentSnapshot = await _firebaseFirestore
            .collection("users")
            .doc(_firebaseAuth.currentUser!.uid)
            .get();
        print(documentSnapshot.data());
        user.value =
            UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
        print(user.value?.name);
      } else {
        showSnackbar(message: "Invalid Credentials!");
        print("Invalid Credentials!");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<DocumentSnapshot> getStreamUser() {
    return _firebaseFirestore
        .collection("users")
        .doc(_firebaseAuth.currentUser!.uid)
        .snapshots();
  }
}
