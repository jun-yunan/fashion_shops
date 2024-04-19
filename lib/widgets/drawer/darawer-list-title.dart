import 'package:flutter/material.dart';

class DrawerListTitle extends StatelessWidget {
  final String title;
  final void Function()? onTap;

  const DrawerListTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      leading: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: Colors.black87,
        ),
        child: const Icon(
          Icons.person,
          size: 24,
          color: Colors.white,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: Colors.black87,
      ),
      onTap: onTap,
    );
  }
}
