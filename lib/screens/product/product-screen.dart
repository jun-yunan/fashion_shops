import 'package:fashion_shops/controllers/product-controller.dart';
import 'package:fashion_shops/models/product-model.dart';
import 'package:fashion_shops/utils/utils.dart';
import 'package:fashion_shops/widgets/product/banner.dart';
import 'package:fashion_shops/widgets/product/preview-products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const BannerProduct(),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TRENDING THIS WEEK',
                    style: GoogleFonts.oswald(
                      textStyle: const TextStyle(
                        color: Colors.black87,
                        letterSpacing: .5,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showSnackbar(message: "message");
                    },
                    child: const Text(
                      "VIEW ALL",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const PreviewProducts(),
            // const SizedBox(
            //   height: 150,
            // ),
          ],
        ),
      ),
    );
  }
}
