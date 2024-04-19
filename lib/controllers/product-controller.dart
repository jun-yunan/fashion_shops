import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shops/models/product-model.dart';
import 'package:fashion_shops/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class ProductController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();
  final FirebaseDatabase database = FirebaseDatabase.instance;

  final nameController = Rx<TextEditingController>(TextEditingController());
  final priceController = Rx<TextEditingController>(TextEditingController());
  final imageController = Rx<TextEditingController>(TextEditingController());
  final descriptionController =
      Rx<TextEditingController>(TextEditingController());
  final categoryIdController =
      Rx<TextEditingController>(TextEditingController());
  final brandController = Rx<TextEditingController>(TextEditingController());
  final sizeController = Rx<TextEditingController>(TextEditingController());
  final colorController = Rx<TextEditingController>(TextEditingController());
  final materialController = Rx<TextEditingController>(TextEditingController());
  final discountController = Rx<TextEditingController>(TextEditingController());
  final stockController = Rx<TextEditingController>(TextEditingController());
  final saleCountController =
      Rx<TextEditingController>(TextEditingController());

  final imageFile = Rx<File?>(null);

  final products = RxList<ProductModel>([]);

  final selectedProduct = Rx<ProductModel>(ProductModel());

  final isFavorite = RxBool(false);

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

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
    update();
  }

  void handleSelectedProduct(ProductModel product) {
    selectedProduct.value = product;
    update();
  }

  Future<void> getAllProduct() async {
    await _firebaseFirestore
        .collection("products")
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        products.assignAll(querySnapshot.docs.map((doc) {
          return ProductModel.fromJson(doc.data() as Map<String, dynamic>);
        }).toList());
      }
    });
  }

  Stream<List<ProductModel>> getListProductRealTime() {
    return _firebaseFirestore
        .collection("products")
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ProductModel.fromJson(doc.data());
      }).toList();
    });
  }
}
