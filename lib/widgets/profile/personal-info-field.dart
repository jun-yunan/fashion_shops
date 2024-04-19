import 'package:fashion_shops/controllers/profile-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoField extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  const PersonalInfoField(
      {super.key,
      required this.label,
      required this.hintText,
      this.controller,
      this.onTap,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.oswald(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(height: 6),
          TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            controller: controller,
            decoration: InputDecoration(
              // labelText: label,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              // labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
