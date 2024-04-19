import 'package:flutter/foundation.dart';

class CartItem {
  final String productId;
  final String productName;
  final double price;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.imageUrl,
    required this.productId,
    required this.productName,
    required this.price,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      "imageUrl": imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}

class Cart {
  List<CartItem> items = [];

  double get total {
    return items.fold(
        0,
        (previousValue, element) =>
            previousValue + (element.price * element.quantity));
  }

  void addToCart(CartItem item) {
    // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng hay chưa
    var existingItemIndex =
        items.indexWhere((element) => element.productId == item.productId);

    if (existingItemIndex != -1) {
      // Nếu sản phẩm đã tồn tại, tăng số lượng lên
      items[existingItemIndex].quantity += item.quantity;
    } else {
      // Nếu sản phẩm chưa tồn tại, thêm vào giỏ hàng
      items.add(item);
    }
  }

  void removeFromCart(String productId) {
    items.removeWhere((element) => element.productId == productId);
  }

  void clearCart() {
    items.clear();
  }
}
