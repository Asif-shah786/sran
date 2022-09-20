import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:get/get.dart';
import 'package:sran/core/utils/math_utils.dart';

import '../../controllers/intro_controller.dart';
import '../../core/utils/color_constant.dart';
import '../../routes/app_pages.dart';
//
// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);
//
//   @override
//   State<SplashView> createState() => _SplashViewState();
// }
//
// class _SplashViewState extends State<SplashView> {
//
//   @override
//   void initState() {
//     super.initState();
//     slides.add(
//       Slide(
//         title: "Welcome",
//         description:
//             "Allow miles wound place the leave had. To sitting subject no improve studied limited",
//         pathImage: "assets/images/splash_1.png",
//         widthImage: getVerticalSize(400),
//         heightImage: getVerticalSize(400),
//         backgroundColor: Colors.white,
//         styleTitle: const TextStyle(
//           wordSpacing: 1.5,
//           color: kPrimaryColor,
//           fontSize: 30,
//           fontWeight: FontWeight.w500,
//         ),
//         styleDescription: const TextStyle(
//           wordSpacing: 1.0,
//           color: kPrimaryColor,
//           fontSize: 20,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     );
//     slides.add(
//       Slide(
//         title: "SRAN",
//         description:
//             "Allow miles wound place the leave had. To sitting subject no improve studied limited",
//         pathImage: "assets/images/splash_2.png",
//         widthImage: getVerticalSize(400),
//         heightImage: getVerticalSize(400),
//         backgroundColor: Colors.white,
//         styleTitle: const TextStyle(
//           wordSpacing: 1.5,
//           color: kPrimaryColor,
//           fontSize: 30,
//           fontWeight: FontWeight.w500,
//         ),
//         styleDescription: const TextStyle(
//           wordSpacing: 1.0,
//           color: kPrimaryColor,
//           fontSize: 20,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     );
//     slides.add(
//       Slide(
//         title: "SRAN",
//         description:
//             "Allow miles wound place the leave had. To sitting subject no improve studied limited",
//         pathImage: "assets/images/splash_3.png",
//         widthImage: getVerticalSize(400),
//         heightImage: getVerticalSize(400),
//         backgroundColor: Colors.white,
//         styleTitle: const TextStyle(
//           wordSpacing: 1.5,
//           color: kPrimaryColor,
//           fontSize: 30,
//           fontWeight: FontWeight.w500,
//         ),
//         styleDescription: const TextStyle(
//           wordSpacing: 1.0,
//           color: kPrimaryColor,
//           fontSize: 20,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return IntroSlider(
//       typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
//       nextButtonStyle: TextButton.styleFrom(
//         fixedSize: const Size(70, 30),
//         backgroundColor: kPrimaryColor,
//         foregroundColor: kWhiteColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18),
//         ),
//       ),
//       skipButtonStyle: TextButton.styleFrom(
//         fixedSize: const Size(70, 30),
//         backgroundColor: kPrimaryColor,
//         foregroundColor: kWhiteColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18),
//         ),
//       ),
//       doneButtonStyle: TextButton.styleFrom(
//         fixedSize: const Size(70, 30),
//         backgroundColor: kPrimaryColor,
//         foregroundColor: kWhiteColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18),
//         ),
//       ),
//       slides: slides,
//       onDonePress: onDonePress,
//     );
//   }
// }

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);
  @override


  Widget build(BuildContext context) {
    return Scaffold(
        body:  IntroSlider(
          typeDotAnimation: DotSliderAnimation.SIZE_TRANSITION,
          nextButtonStyle: TextButton.styleFrom(
            fixedSize: const Size(70, 30),
            backgroundColor: kPrimaryColor,
            foregroundColor: kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          skipButtonStyle: TextButton.styleFrom(
            fixedSize: const Size(70, 30),
            backgroundColor: kPrimaryColor,
            foregroundColor: kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          doneButtonStyle: TextButton.styleFrom(
            fixedSize: const Size(70, 30),
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



