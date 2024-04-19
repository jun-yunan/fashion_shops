import 'package:fashion_shops/controllers/auth-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  final String? hintText;
  final String? errorMessage;
  final String label;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const InputField({
    super.key,
    this.hintText,
    this.controller,
    this.errorMessage,
    required this.label,
    this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    return Obx(
      () => SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(authController.fakeVar.value),
                if (icon != null) Icon(icon),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              // controller: keyboardType == TextInputType.emailAddress
              //     ? authController.emailController.value
              //     : keyboardType == TextInputType.visiblePassword
              //         ? authController.passwordController.value
              //         : null,
              controller: controller,
              keyboardType: keyboardType,
              obscureText: keyboardType == TextInputType.visiblePassword &&
                      !authController.isShowPassword.value
                  ? true
                  : false,

              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                suffixIcon: keyboardType == TextInputType.visiblePassword
                    ? IconButton(
                        onPressed: () {
                          authController.setShowPassword();
                        },
                        icon: authController.isShowPassword.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      )
                    : null,
                fillColor: Colors.white,
                hintText: hintText,
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black45, width: 1.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                focusColor: Colors.black45,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                  borderSide: BorderSide(color: Colors.black87, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
