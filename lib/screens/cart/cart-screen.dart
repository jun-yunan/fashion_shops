import 'package:fashion_shops/controllers/cart-controller.dart';
import 'package:fashion_shops/models/cart-model.dart';
import 'package:fashion_shops/utils/utils.dart';
import 'package:fashion_shops/widgets/cart/cart-list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MY CART",
          style: GoogleFonts.oswald(
            textStyle:
                const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products",
                    style: GoogleFonts.oswald(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Obx(
                    () => Text(
                      "${cartController.totalItems.value} Items",
                      style: GoogleFonts.oswald(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: CartList(),
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: Colors.black87,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  showSnackbar(message: "message");
                },
                child: Text(
                  "\$${cartController.totalPrice.value.toStringAsFixed(2)}      Checkout",
                  style: GoogleFonts.oswald(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
