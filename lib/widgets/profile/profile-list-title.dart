import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileListTitle extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData leadingIcon;
  final IconData trailingIcon;
  const ProfileListTitle(
      {super.key,
      required this.title,
      this.onTap,
      required this.leadingIcon,
      required this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(
        title,
        style: GoogleFonts.oswald(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          leadingIcon,
          size: 28,
          color: Colors.black87,
        ),
      ),
      trailing: Icon(
        trailingIcon,
        size: 18,
        color: Colors.black87,
      ),
      onTap: onTap,
    );
  }
}
