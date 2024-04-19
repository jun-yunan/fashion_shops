// ignore: file_names
import 'package:fashion_shops/widgets/auth/form-login.dart';
import 'package:fashion_shops/widgets/auth/logo-header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/bg-auth-5.jpg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              const Positioned(
                top: 25,
                child: LogoHeader(),
              ),
              const FormLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
