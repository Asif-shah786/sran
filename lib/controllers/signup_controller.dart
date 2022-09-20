import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sran/core/utils/common.dart';
import 'package:sran/core/utils/progress_dialog_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../core/utils/collections.dart';
import '../core/utils/color_constant.dart';
import '../routes/app_pages.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  final ImagePicker imagePicker = ImagePicker();
  var imageName = "".obs, imageSize = 0.obs, imagePath = "".obs;
  DateTime _selectedDate = DateTime.now();


  List<String> pageHeading = [
    "Signup",
    "Profile Photo",
  ];
  List<String> nextButton = [
    "Next",
    "Let\' dive in..",
  ];
  onNext() async {
    switch (currentPage.value) {
      case 0:
      //signup
      //   if (!formKey.currentState!.validate()) {
      //     return;
      //   }
        currentPage.value++;
        pageController.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        break;
      case 1:
      //profile photo
      //   ProgressDialogUtils.showProgressDialog();
      //
      //   try {
      //     await FirebaseAuth.instance
      //         .createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
      //         .then((value) async {
      //       String profilePicture = "";
      //       String uid = value.user!.uid;
      //
      //       if (imagePath.value.isNotEmpty) {
      //         String ext = imagePath.value.split(".").last;
      //         final storageRef = FirebaseStorage.instance.ref();
      //         final usersAvatarRef = storageRef.child("users/$uid/${DateTime.now().millisecondsSinceEpoch}.$ext");
      //         try {
      //           await usersAvatarRef.putFile(File(imagePath.value));
      //           profilePicture = await usersAvatarRef.getDownloadURL();
      //         } on FirebaseException catch (e) {
      //           customToast(e.toString());
      //         }
      //       }
      //
      //       await usersCollection.doc(uid).set({
      //         "name": nameController.text.trim(),
      //         "email": emailController.text.toLowerCase().trim(),
      //         "profilePicture": profilePicture,
      //         "joined": DateTime.now(),
      //       }).then((value) {
      //         customToast("Account created successfully");
              Get.offAllNamed(Routes.BOTTOMNAVIGATIONTABS, parameters: {"uid": 'uid'});
      //       });
      //     });
      //   } on FirebaseAuthException catch (e) {
      //     switch (e.code) {
      //       case "email-already-in-use":
      //         customToast("Email already in use");
      //         break;
      //       case "weak-password":
      //         customToast("Weak password");
      //         break;
      //       case "invalid-email":
      //         customToast("Invalid email format");
      //         break;
      //     }
      //   }
        break;

    }
  }

  void openImageSelect() => Get.defaultDialog(
      title: "Select Profile Picture",
      titleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: kPrimaryColor),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            onTap: () {
              pickImage(gallery: true);
              Get.back();
            },
            title: const Text("Open Gallery", style: TextStyle(fontSize: 15)),
          ),
          ListTile(
            onTap: () {
              pickImage();
              Get.back();
            },
            title: const Text("Open Camera", style: TextStyle(fontSize: 15)),
          ),
        ],
      ),
      backgroundColor: kWhiteColor);


  void pickImage({bool gallery = false}) async {
    final XFile? image = await imagePicker.pickImage(source: gallery ? ImageSource.gallery : ImageSource.camera);
    if (image == null) return;
    imageSize.value = await image.length() ~/ 1000;
    if (imageSize.value > 700) {
      customToast("Max file limit exceeds");
      return;
    }

    imageName.value = image.name;
    imagePath.value = image.path;
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    pageController.dispose();
    super.onClose();
  }

}
