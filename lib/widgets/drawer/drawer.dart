import 'package:fashion_shops/controllers/auth-controller.dart';
import 'package:fashion_shops/screens/admin/admin-screen.dart';
import 'package:fashion_shops/utils/utils.dart';
import 'package:fashion_shops/widgets/drawer/darawer-list-title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Drawer(
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.black87),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  minRadius: 75,
                  backgroundImage: AssetImage('assets/images/bg-auth-1.jpg'),
                ),
                Text(
                  "Jun Yunan",
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
                Text(
                  "junyunan@gmail.com",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ],
            ),
          ),
          DrawerListTitle(
            title: "Admin",
            onTap: () {
              Get.to(() => const AdminScreen());
            },
          ),
          DrawerListTitle(
            title: "Profile",
            onTap: () {
              showSnackbar(message: 'message');
            },
          ),
          DrawerListTitle(
            title: "Profile",
            onTap: () {
              showSnackbar(message: 'message');
            },
          ),
          DrawerListTitle(
            title: "Profile",
            onTap: () {
              showSnackbar(message: 'message');
            },
          ),
          DrawerListTitle(
            title: "Profile",
            onTap: () {
              showSnackbar(message: 'message');
            },
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              backgroundColor: Colors.black87,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide.none,
              ),
            ),
            onPressed: () {
              // showSnackbar(message: "message");
              authController.handleLogOut();
            },
            icon: const Icon(
              Icons.logout,
              size: 22,
              color: Colors.white,
            ),
            label: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
