import 'package:flutter/material.dart';

enum ButtonType { solid, outline }

class Button extends StatelessWidget {
  final String text;
  final ButtonType? style;
  final void Function()? onPressed;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.style = ButtonType.solid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: style == ButtonType.solid
              ? Colors.black
              : Colors.white.withOpacity(0.5),
          // padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: style == ButtonType.solid
                ? BorderSide.none
                : const BorderSide(color: Colors.black87, width: 2),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            letterSpacing: 2.5,
            color: style == ButtonType.solid ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
