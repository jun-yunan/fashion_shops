import 'package:fashion_shops/controllers/auth-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Container(
      height: 70,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          authController.signInWithGoogle();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide(color: Colors.black45, width: 2)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/google.png',
              fit: BoxFit.cover,
              width: 55,
              height: 55,
            ),
            const SizedBox(
              width: 26,
            ),
            const Text(
              "Sign in with Google",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
}
