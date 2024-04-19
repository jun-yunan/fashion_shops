import 'package:fashion_shops/controllers/cart-controller.dart';
import 'package:fashion_shops/models/cart-model.dart';
import 'package:fashion_shops/widgets/cart/cart-item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    return StreamBuilder(
      stream: cartController.getCartItems(),
      builder: (builder, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        }
        final List<CartItem> cartItems = snapshot.data!;
        cartController.totalItems.value = cartItems.length;
        cartController.totalPrice.value =
            cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

        // cartController.cartItems.value = cartItems;
        return ListView.builder(
          // shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final CartItem cartItem = cartItems[index];
            return CartItemList(cartItem: cartItem);
          },
        );
      },
    );
  }
}
