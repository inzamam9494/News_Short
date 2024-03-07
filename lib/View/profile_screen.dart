import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_short/Authentication/components/my_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    setState(() {
      Get.back();
    });
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(
                      onTap: () {
                        pickImage(ImageSource.camera);
                      },
                      Mytext: 'CAMERA'),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(
                      onTap: () {
                        pickImage(ImageSource.gallery);
                      },
                      Mytext: 'GALLERY'),
                  const SizedBox(
                    height: 10,
                  ),
              MyButton(
                  onTap: () {
                    Get.back();
                  },
                  Mytext: 'CANCEL'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade500, width: 3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipOval(
                    child: pickedImage != null
                        ? Image.file(
                            pickedImage!,
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'images/icons/user.png',
                            width: 170,
                            height: 170,
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: IconButton(
                    onPressed: imagePickerOption,
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                  child: Text(
                user!.email.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(
              onTap: imagePickerOption,
              Mytext: 'UPLOAD IMAGE',
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                onTap: signUserOut,
                Mytext: 'LOG OUT',
              )),
        ],
      ),
    );
  }
}
