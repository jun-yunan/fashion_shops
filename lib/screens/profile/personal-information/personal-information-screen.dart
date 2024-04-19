import 'package:fashion_shops/controllers/profile-controller.dart';
import 'package:fashion_shops/widgets/profile/personal-info-field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());

    profileController.nameController.value.text =
        profileController.user.value?.name ?? "";

    profileController.addressController.value.text =
        profileController.user.value?.address ?? "";

    profileController.birthdayController.value.text =
        profileController.user.value?.birthday ?? "";

    profileController.numberPhoneController.value.text =
        profileController.user.value?.numberPhone ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Information",
          style: GoogleFonts.oswald(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            foregroundColor: Colors.black87,
            backgroundColor: Colors.grey.shade200,
          ),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        title: const Text("Choose Image"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: const Icon(Icons.camera_alt_outlined),
                              title: const Text("Camera"),
                              onTap: () {
                                // Utils.getImageFromCamera();
                                // utilsController.getImageFromCamera();
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.image_outlined),
                              title: const Text("Gallery"),
                              onTap: () {
                                // Utils.getImageFromGallery();
                                // utilsController.getImageFromGallery();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          profileController.user.value?.avatarUrl ??
                              "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png",
                        ),
                      ),
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profileController.user.value?.name ?? "unknown",
                      style: GoogleFonts.oswald(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      profileController.user.value?.email ?? "unknown",
                      style: GoogleFonts.oswald(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 45),
            PersonalInfoField(
              label: "Full Name",
              hintText: "Enter your name here...",
              controller: profileController.nameController.value,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Obx(
                  () => Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        DropdownButton<String>(
                          style: GoogleFonts.oswald(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          value: profileController.gender.value,
                          onChanged: (newValue) {
                            profileController.setGender(newValue);
                          },
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'male',
                              child: Text('Male'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'female',
                              child: Text('Female'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'other',
                              child: Text('Other'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => PersonalInfoField(
                      readOnly: true,
                      label: "Birthday",
                      hintText: "Enter your birthday here...",
                      controller: profileController.birthdayController.value,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        ).then((value) {
                          profileController.birthdayController.value.text =
                              "${value?.day}-${value?.month}-${value?.year}";
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            PersonalInfoField(
              label: "Phone Number",
              hintText: "Enter your phone number here...",
              controller: profileController.addressController.value,
            ),
            const SizedBox(height: 20),
            PersonalInfoField(
              label: "Address",
              hintText: "Enter your address here...",
              controller: profileController.addressController.value,
            ),
            const SizedBox(height: 26),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              onPressed: () {
                profileController.updateProfile();
              },
              child: Text(
                "Save".toUpperCase(),
                style: GoogleFonts.oswald(
                  textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
