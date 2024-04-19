import 'package:fashion_shops/firebase_options.dart';
import 'package:fashion_shops/screens/admin/add-product-screen/add-product-screen.dart';
import 'package:fashion_shops/screens/admin/admin-screen.dart';
import 'package:fashion_shops/screens/auth/auth-screen.dart';
import 'package:fashion_shops/screens/auth/forgot-password/forgot-password-screen.dart';
import 'package:fashion_shops/screens/auth/login/login-screen.dart';
import 'package:fashion_shops/screens/auth/register/register-screen.dart';
import 'package:fashion_shops/screens/cart/cart-screen.dart';
import 'package:fashion_shops/screens/home/home-screen.dart';
import 'package:fashion_shops/screens/product/product-details/details-screen.dart';
import 'package:fashion_shops/screens/product/product-screen.dart';
import 'package:fashion_shops/screens/profile/personal-information/personal-information-screen.dart';
import 'package:fashion_shops/screens/profile/profile-screen.dart';
import 'package:fashion_shops/screens/search/search-screen.dart';
import 'package:fashion_shops/screens/splash/splash-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // unknownRoute:
      //     GetPage(name: '/notfound', page: () => const UnknownRoutePage()),
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/auth/login', page: () => const LoginScreen()),
        GetPage(name: '/auth', page: () => const AuthScreen()),
        GetPage(name: '/auth/register', page: () => const RegisterScreen()),
        GetPage(
            name: '/auth/forgot-password',
            page: () => const ForgotPasswordScreen()),
        GetPage(name: '/cart', page: () => const CartScreen()),
        GetPage(name: '/product', page: () => const ProductScreen()),
        GetPage(
            name: '/product/details', page: () => const ProductDetailScreen()),
        GetPage(name: '/search', page: () => const SearchScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(
            name: '/profile/personal-information',
            page: () => const PersonalInformationScreen()),
        GetPage(name: '/admin', page: () => const AdminScreen()),
        GetPage(
            name: '/admin/add-product', page: () => const AddProductScreen()),
        // GetPage(
        //   name: '/cart',
        //   page: () => const CartScreen(),
        //   transition: Transition.zoom,
        // )
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
