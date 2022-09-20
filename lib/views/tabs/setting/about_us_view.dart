import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/about_us_controller.dart';
import '../../../core/widgets/custom_toolbar.dart';

class AboutUsView extends GetView<AboutUsController> {
  const AboutUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'About Us', backFlag: true, profileActive: false,),
      body: Column(
        children: [
          Text('')
        ],
      ),
    );
  }
}
