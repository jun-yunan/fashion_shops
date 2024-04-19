import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Fashion',
          style: TextStyle(
            fontSize: 65,
            color: Colors.black87,
            fontWeight: FontWeight.w300,
            letterSpacing: 2.5,
          ),
        ),
        Image.asset(
          'assets/images/shoes-1.png',
          width: 100,
          height: 100,
        )
      ],
    );
  }
}
