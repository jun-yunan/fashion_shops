import 'package:fashion_shops/controllers/cart-controller.dart';
import 'package:fashion_shops/controllers/product-controller.dart';
import 'package:fashion_shops/models/cart-model.dart';
import 'package:fashion_shops/models/product-model.dart';
import 'package:fashion_shops/widgets/buttons/button.dart';
import 'package:fashion_shops/widgets/product/button-details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final ProductModel product = Get.arguments;
    final ProductController productController = Get.find();
    final ProductModel product = productController.selectedProduct.value;
    final CartController cartController = Get.put(CartController());
    print(product.name);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PRODUCT DETAILS",
          style: GoogleFonts.oswald(
              textStyle:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: const Icon(Icons.local_mall_outlined),
          ),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                child: Text("Edit"),
              ),
              const PopupMenuItem(
                child: Text("Delete"),
              ),
            ];
          })
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              ListView(
                children: [
                  Image.network(
                    product.images!.toString(),
                    fit: BoxFit.cover,
                    height: 600,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name!,
                              style: GoogleFonts.oswald(
                                textStyle: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Obx(
                              () => IconButton(
                                onPressed: () {
                                  // productController.selectedProduct(product);
                                  productController.toggleFavorite();
                                },
                                icon: productController.isFavorite.value
                                    ? const Icon(Icons.favorite)
                                    : const Icon(Icons.favorite_border),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$${product.price!}',
                          style: GoogleFonts.oswald(
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          product.description!,
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        // Text(product.color!),
                        // Text(product.size!),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 300,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Column(
                  children: [
                    ButtonProductDetails(
                      text: "ADD TO CART",
                      onPressed: () {
                        cartController.addToCart(
                          CartItem(
                            productId: product.productId!,
                            productName: product.name!,
                            imageUrl: product.images!,
                            price: double.parse(product.price!),
                          ),
                        );
                      },
                      style: ButtonType.outline,
                      icon: Icons.shopping_cart_outlined,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ButtonProductDetails(text: "BUY NOW", onPressed: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
