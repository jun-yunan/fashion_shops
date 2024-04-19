import 'package:fashion_shops/controllers/auth-controller.dart';
import 'package:fashion_shops/utils/utils.dart';
import 'package:fashion_shops/widgets/buttons/button.dart';
import 'package:fashion_shops/widgets/buttons/social-button.dart';
import 'package:fashion_shops/widgets/form/input-field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 165,
            ),
            InputField(
              hintText: 'Jun Yunan',
              label: 'Name',
              icon: Icons.person,
              keyboardType: TextInputType.name,
              controller: authController.nameController.value,
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
            InputField(
              hintText: '*********',
              label: 'Password',
              icon: Icons.key,
              keyboardType: TextInputType.visiblePassword,
              controller: authController.passwordController.value,
            ),
            const SizedBox(
              height: 25,
            ),
            Button(
                text: 'REGISTER',
                onPressed: () async {
                  if (authController.emailController.value.text.isEmpty ||
                      authController.passwordController.value.text.isEmpty) {
                    showSnackbar(message: "Email and Password is required.");
                  } else {
                    await authController.signUpWithEmailAndPassword(
                      email: authController.emailController.value.text.trim(),
                      password:
                          authController.passwordController.value.text.trim(),
                      name: authController.nameController.value.text.trim(),
                      context: context,
                    );
                  }
                }),
            const SizedBox(
              height: 25,
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Continue with',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const SocialButton(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/auth/login');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
