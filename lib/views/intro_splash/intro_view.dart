import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:get/get.dart';
import 'package:sran/core/utils/math_utils.dart';

import '../../controllers/intro_controller.dart';
import '../../core/utils/color_constant.dart';
import '../../routes/app_pages.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override


  Widget build(BuildContext context) {
    return Scaffold(
        body:  IntroSlider(
          typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
          nextButtonStyle: TextButton.styleFrom(
            fixedSize: const Size(90, 50),
            backgroundColor: kPrimaryColor,
            foregroundColor: kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          skipButtonStyle: TextButton.styleFrom(
            fixedSize: const Size(90, 50),
            backgroundColor: kPrimaryColor,
            foregroundColor: kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          doneButtonStyle: TextButton.styleFrom(
            fixedSize: const Size(90, 50),
            backgroundColor: kPrimaryColor,
            foregroundColor: kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          slides: controller.slides,
          onDonePress: controller.onDonePress,
        )
      );
  }
}



