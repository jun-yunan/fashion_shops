import 'package:fashion_shops/controllers/auth-controller.dart';
import 'package:fashion_shops/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    print(Get.parameters['token']);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/bg.jpg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "BELLEMERÉ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                            color: Colors.black87, // Màu của bóng
                            offset: Offset(2, 2),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const Text(
                          "Your Style Defines",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(
                                color: Colors.black87, // Màu của bóng
                                offset: Offset(2, 2),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "You Everyday",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(
                                color: Colors.black87, // Màu của bóng
                                offset: Offset(2, 2),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Be more stylish everyday, with materials made and selected by professtionals.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              Shadow(
                                color: Colors.black87, // Màu của bóng
                                offset: Offset(2, 2),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Button(
                          text: "LOGIN",
                          onPressed: () {
                            Get.toNamed('/auth/login');
                          },
                          style: ButtonType.solid,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Button(
                            text: "REGISTER",
                            style: ButtonType.outline,
                            onPressed: () {})
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
