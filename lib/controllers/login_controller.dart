import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sran/core/utils/common.dart';

import '../core/utils/progress_dialog_utils.dart';
import '../routes/app_pages.dart';
import 'home_controller.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  // final getStorage = GetStorage();

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  emailLogin() async {
    if (!formKey.currentState!.validate()) return;
    ProgressDialogUtils.showProgressDialog();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        String uid = value.user!.uid;
        customToast('Welcome ${value.user!.displayName}');
        Get.offAllNamed(Routes.BOTTOMNAVIGATIONTABS, parameters: {'uid': uid});
      });
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          customToast('Account not found');
          break;
        case 'wrong-password':
          customToast('Wrong Password');
          break;
        case 'invalid-email':
          customToast('Invalid email format');
          break;
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void login() {
    Get.offAllNamed(Routes.BOTTOMNAVIGATIONTABS);
  }
}
