import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intro_slider/intro_slider.dart';

import '../core/utils/color_constant.dart';
import '../core/utils/constant.dart';
import '../core/utils/math_utils.dart';
import '../routes/app_pages.dart';

class IntroController extends GetxController {
  //TODO: Implement SplashController

  List<Slide> slides = [];
  RxBool introSeen = false.obs;
  RxBool splashScreen = true.obs;

  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    slides.add(
      Slide(
        title: "Welcome",
        description:
        "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/images/splash_1.png",
        widthImage: getVerticalSize(400),
        heightImage: getVerticalSize(400),
        backgroundColor: Colors.white,
        styleTitle: const TextStyle(
          wordSpacing: 1.5,
          color: kPrimaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        styleDescription: const TextStyle(
          wordSpacing: 1.0,
          color: kPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
    slides.add(
      Slide(
        title: "SRAN",
        description:
        "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/images/splash_2.png",
        widthImage: getVerticalSize(400),
        heightImage: getVerticalSize(400),
        backgroundColor: Colors.white,
        styleTitle: const TextStyle(
          wordSpacing: 1.5,
          color: kPrimaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        styleDescription: const TextStyle(
          wordSpacing: 1.0,
          color: kPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
    slides.add(
      Slide(
        title: "SRAN",
        description:
        "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "assets/images/splash_3.png",
        widthImage: getVerticalSize(400),
        heightImage: getVerticalSize(400),
        backgroundColor: Colors.white,
        styleTitle: const TextStyle(
          wordSpacing: 1.5,
          color: kPrimaryColor,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        styleDescription: const TextStyle(
          wordSpacing: 1.0,
          color: kPrimaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    Get.offAndToNamed(Routes.SIGNUP);
  }


  @override
  void onReady() {
    super.onReady();
    if(getStorage.read(introSeenId) == null){
      getStorage.write('intro_seen', true);
      introSeen.value = false;
    }
    else{
      introSeen.value = true;
    }

    // if(getStorage.read('id') != null){
    //   Get.offAllNamed(Routes.);
    // }else{
    //   Get.offAllNamed(Routes.LOGIN);
    // }
  }

  @override
  void onClose() {
    super.onClose();
  }

}
