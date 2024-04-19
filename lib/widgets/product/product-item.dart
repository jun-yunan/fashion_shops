// import 'package:fashion_shops/controllers/product-controller.dart';
import 'package:fashion_shops/controllers/product-controller.dart';
import 'package:fashion_shops/models/product-model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    return GestureDetector(
      onTap: () {
        productController.selectedProduct(product);
        Get.toNamed('/product/details', arguments: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  product.images!.toString(),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.oswald(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '\$${product.price!}',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.oswald(
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
