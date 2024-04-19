import 'package:fashion_shops/screens/admin/add-product-screen/add-product-screen.dart';
import 'package:fashion_shops/widgets/admin/form-product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text("Add product"),
              onTap: () => Get.to(() => const AddProductScreen()),
              leading: const Icon(Icons.add),
              tileColor: Colors.black12,
            ),
            const SizedBox(
              height: 25,
            ),
            ListTile(
              title: const Text("Edit product"),
              onTap: () => Get.to(() => const AddProductScreen()),
              leading: const Icon(Icons.edit),
              tileColor: Colors.black12,
            ),
            const SizedBox(
              height: 25,
            ),
            ListTile(
              title: const Text("Add product"),
              onTap: () => Get.to(() => const AddProductScreen()),
              leading: const Icon(Icons.add),
              tileColor: Colors.black12,
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      )),
    );
  }
}
