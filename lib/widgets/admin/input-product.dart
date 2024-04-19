import 'package:flutter/material.dart';

class InputProduct extends StatelessWidget {
  final TextEditingController? controller;
  final String? errorMessage;
  final String? labelText;
  const InputProduct(
      {super.key, this.controller, this.labelText, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w400),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black87, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      validator: (value) {
        if (value!.isEmpty) {
          return errorMessage;
        }
        return null;
      },
      // onSaved: (value) {
      //   _name = value!;
      // },
    );
  }
}
