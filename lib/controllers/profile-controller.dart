import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shops/models/user-model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final user = Rx<UserModel?>(null);

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance;

  final DatabaseReference userRef =
      FirebaseDatabase.instance.ref("posts/12345");

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> updateProfile() async {
    print("object");
    await userRef.set({
      "name": "jun yunan",
      "email": "junyunan123@gmail.com",
      "address": "can tho city fds",
      "gender": "famale",
      "age": 19
    });
  }
}
