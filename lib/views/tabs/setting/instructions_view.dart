import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sran/core/data/general_data.dart';

import '../../../controllers/instructions_controller.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/widgets/custom_toolbar.dart';


class InstructionsView extends GetView<InstructionsController> {
  const InstructionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Instruction',
        backFlag: true,
        profileActive: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const Text(
              'How to use App',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getVerticalSize(5.00)),
            const Text(
          InstructionData.para1,
            style: TextStyle(
              color: kSubTitleColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
        ),
            SizedBox(height: getVerticalSize(5.00)),
            const Image(image: AssetImage(InstructionData.videoUrl, ),fit: BoxFit.contain,),
            SizedBox(height: getVerticalSize(5.00)),
            const Text(
              InstructionData.para2,
              style: TextStyle(
                color: kSubTitleColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
