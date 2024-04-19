import 'package:fashion_shops/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonProductDetails extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final String text;
  final ButtonType? style;
  const ButtonProductDetails(
      {super.key,
      required this.onPressed,
      required this.text,
      this.style = ButtonType.solid,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton.icon(
        icon: Icon(icon),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          backgroundColor:
              style == ButtonType.solid ? Colors.black : Colors.white,
          foregroundColor:
              style == ButtonType.solid ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        label: Text(
          text,
          style: GoogleFonts.oswald(
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
