import 'package:fashion_shops/controllers/product-controller.dart';
import 'package:fashion_shops/utils/utils.dart';
import 'package:fashion_shops/widgets/admin/input-product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormAddProduct extends StatefulWidget {
  @override
  _FormAddProductState createState() => _FormAddProductState();
}

class _FormAddProductState extends State<FormAddProduct> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showSnackbar(message: "message");
                  },
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        productController.imageFile.value != null
                            ? Image.file(
                                productController.imageFile.value!,
                                width: 150,
                                height: 250,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/images/bg-auth-1.jpg",
                                width: 150,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              // Delete image
                            },
                            style: IconButton.styleFrom(
                                padding: const EdgeInsets.all(8),
                                backgroundColor: Colors.grey),
                            icon: const Icon(
                              Icons.close,
                              size: 26,
                              color: Colors.black54,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      // productController.selectImage();
                    },
                    child: Text("Select image")),
                // ElevatedButton(onPressed: () {}, child: Text("Delete"))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            InputProduct(
              errorMessage: "Name is required.",
              labelText: "Name",
              controller: productController.nameController.value,
            ),
            const SizedBox(
              height: 15,
            ),
            InputProduct(
              errorMessage: "description is required.",
              labelText: "description",
              controller: productController.descriptionController.value,
            ),
            const SizedBox(
              height: 15,
            ),
            InputProduct(
              errorMessage: "price is required.",
              labelText: "price",
              controller: productController.priceController.value,
            ),
            const SizedBox(
              height: 15,
            ),
            InputProduct(
              errorMessage: "images is required.",
              labelText: "images",
              controller: productController.imageController.value,
            ),
            const SizedBox(
              height: 15,
            ),
            InputProduct(
              errorMessage: "brand is required.",
              labelText: "brand",
              controller: productController.brandController.value,
            ),
            const SizedBox(
              height: 15,
            ),
            InputProduct(
              errorMessage: "size is required.",
              labelText: "size",
              controller: productController.sizeController.value,
            ),
            const SizedBox(
              height: 15,
            ),
            InputProduct(
              errorMessage: "color is required.",
              labelText: "color",
              controller: productController.colorController.value,
            ),
            const SizedBox(
              height: 15,
            ),
            InputProduct(
              errorMessage: "material is required.",
              labelText: "material",
              controller: productController.materialController.value,
            ),
            const SizedBox(
              height: 15,
            ),
            InputProduct(
              errorMessage: "discount is required.",
              labelText: "discount",
              controller: productController.discountController.value,
            ),
            const SizedBox(
              height: 15,
            ),
            InputProduct(
              errorMessage: "stock is required.",
              labelText: "stock",
              controller: productController.stockController.value,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Đã gửi: $_name, $_email'),
                      ),
                    );
                  }
                },
                child: const Text(
                  'Add Product',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
