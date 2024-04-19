import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shops/controllers/profile-controller.dart';
import 'package:fashion_shops/models/user-model.dart';
import 'package:fashion_shops/widgets/profile/profile-list-title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "MY PROFILE",
      //     style: GoogleFonts.oswald(
      //       textStyle:
      //           const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
      //     ),
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: const Icon(Icons.close),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            StreamBuilder(
                stream: profileController.getStreamUser(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    profileController.user.value = UserModel.fromJson(
                        snapshot.data!.data() as Map<String, dynamic>);

                    UserModel user = UserModel.fromJson(
                        snapshot.data!.data() as Map<String, dynamic>);

                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(user.avatarUrl ??
                                "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name ?? "unknown",
                                style: GoogleFonts.oswald(
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text(
                                user.email ?? "unknown",
                                style: GoogleFonts.oswald(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Profile",
              style: GoogleFonts.oswald(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ProfileListTitle(
              title: "Personal Information",
              trailingIcon: Icons.arrow_forward_ios,
              leadingIcon: Icons.person_outline,
              onTap: () {
                Get.toNamed('/profile/personal-information');
              },
            ),
            const Divider(color: Colors.black26, thickness: 1),
            ProfileListTitle(
              title: "Location",
              trailingIcon: Icons.arrow_forward_ios,
              leadingIcon: Icons.location_on_outlined,
              onTap: () {},
            ),
            const Divider(color: Colors.black26, thickness: 1),
            ProfileListTitle(
              title: "Payment Method",
              trailingIcon: Icons.arrow_forward_ios,
              leadingIcon: Icons.credit_card_outlined,
              onTap: () {},
            ),
            const Divider(color: Colors.black26, thickness: 1),
            ProfileListTitle(
              title: "Language",
              trailingIcon: Icons.arrow_forward_ios,
              leadingIcon: Icons.g_translate_outlined,
              onTap: () {},
            ),
            const Divider(color: Colors.black26, thickness: 1),
            const SizedBox(
              height: 12,
            ),
            Text(
              "FAQ?",
              style: GoogleFonts.oswald(
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ProfileListTitle(
              title: "Help & Support",
              trailingIcon: Icons.arrow_forward_ios,
              leadingIcon: Icons.help_outline,
              onTap: () {},
            ),
            const Divider(color: Colors.black26, thickness: 1),
            ProfileListTitle(
              title: "About Us",
              trailingIcon: Icons.arrow_forward_ios,
              leadingIcon: Icons.info_outline,
              onTap: () {},
            ),
            const Divider(color: Colors.black26, thickness: 1),
            ProfileListTitle(
              title: "Log Out",
              trailingIcon: Icons.arrow_forward_ios,
              leadingIcon: Icons.logout_outlined,
              onTap: () {},
            ),
          ],
        ),
      )),
    );
  }
}
