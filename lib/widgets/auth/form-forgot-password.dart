import 'package:fashion_shops/controllers/auth-controller.dart';
import 'package:fashion_shops/utils/utils.dart';
import 'package:fashion_shops/widgets/buttons/button.dart';
import 'package:fashion_shops/widgets/form/input-field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormForgotPassword extends StatelessWidget {
  const FormForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/lock.png'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Forgot Password?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Don't worry, happens to the best of us. Type your email to reset your password.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 25,
            ),
            InputField(
              hintText: 'example@gmail.com',
              label: 'Email',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              controller: authController.emailController.value,
            ),
            const SizedBox(
              height: 25,
            ),
            Button(
              text: 'SEND',
              onPressed: () {
                if (authController.emailController.value.text.isEmpty) {
                  showSnackbar(message: "Email is required!");
                } else {
                  authController.resetPassword(
                      email: authController.emailController.value.text.trim());
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Remember password? ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/auth/login');
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
