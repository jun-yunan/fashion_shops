import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shops/models/cart-model.dart';
import 'package:fashion_shops/models/product-model.dart';
import 'package:fashion_shops/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final cartItems = RxList<CartItem>([]);
  final totalPrice = Rx<double>(0.0);
  final totalItems = Rx<int>(0);
  final totalQuantity = Rx<int>(0);
  final userId = Rx<String>('');

  @override
  void onInit() {
    // TODO: implement onInit
    userId.value = getUserId();
    update();
    super.onInit();
  }

  String getUserId() {
    return _auth.currentUser!.uid;
  }
  // final products = RxList<ProductModel>([]);

  // void addProduct(ProductModel product) {
  //   products.add(product);
  // }

  // void removeProduct(ProductModel product) {
  //   products.remove(product);
  // }

  // void clearCart() {
  //   products.clear();
  // }

  // double get totalPrice {
  //   return products.fold(0, (sum, item) => sum + double.parse(item.price!) * 1);
  // }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addToCart(CartItem cartItem) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId.value)
          .collection('cart')
          .doc(cartItem.productId)
          .set(cartItem.toMap())
          .then((value) {
        showSnackbar(
            message: "Added to cart successfully",
            style: SnackBarStyle.success);
      });
    } catch (error) {
      showSnackbar(message: error.toString(), style: SnackBarStyle.success);
      print('Error adding to cart: $error');
    }
  }

  Future<void> removeFromCart(String productId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId.value)
          .collection('cart')
          .doc(productId)
          .delete();
    } catch (error) {
      print('Error removing from cart: $error');
    }
  }

  Stream<List<CartItem>> getCartItems() {
    return _firestore
        .collection('users')
        .doc(userId.value)
        .collection('cart')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return CartItem(
          productId: doc['productId'],
          productName: doc['productName'],
          imageUrl: doc['imageUrl'],
          price: doc['price'],
          quantity: doc['quantity'],
        );
      }).toList();
    });
  }
}
