import 'package:fashion_shops/controllers/product-controller.dart';
import 'package:fashion_shops/widgets/product/product-item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewProducts extends StatelessWidget {
  const PreviewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return FutureBuilder(
      future: productController.getAllProduct(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("loading");
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return Center(child: Text('Đã xảy ra lỗi: ${snapshot.error}'));
        } else {
          // return ListView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: productController.products.length,
          //   itemBuilder: (BuildContext context, int index) {
          //     return
          //   },
          // );

          return Obx(
            () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: productController.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 400, // Chiều cao của mỗi item
                crossAxisCount: 2, // Số cột
                crossAxisSpacing: 15, // Khoảng cách giữa các cột
                mainAxisSpacing: 0, // Khoảng cách giữa các dòng
                childAspectRatio:
                    0.75, // Tỷ lệ chiều rộng so với chiều cao của mỗi item
              ),
              itemBuilder: (context, index) {
                final product = productController.products[index];
                return ProductItem(product: product);
              },
            ),
          );
        }
      },
    );
  }
}
