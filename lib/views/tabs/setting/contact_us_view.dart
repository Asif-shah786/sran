import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/contact_us_controller.dart';
import '../../../core/data/general_data.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/widgets/custom_toolbar.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Contact Us',
        backFlag: true,
        profileActive: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Let\'s get in touch',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: getVerticalSize(5.00)),
            const Text(
              'We are here for you. Feel free to contact.',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: kSubTitleColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: getVerticalSize(20.00)),
                  buildContactUsTile(
                      context: context,
                      title: 'Address',
                      subTitle: ContactUsData.address,
                      icon: Icons.place_rounded),
                  SizedBox(height: getVerticalSize(20.00)),
                  buildContactUsTile(
                      context: context,
                      title: 'E-Mail',
                      subTitle: ContactUsData.email,
                      icon: Icons.email_rounded),
                  SizedBox(height: getVerticalSize(20.00)),
                  buildContactUsTile(
                      context: context,
                      title: 'Call us',
                      subTitle: ContactUsData.phone,
                      icon: Icons.phone_rounded),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildContactUsTile({
    required BuildContext context,
    required String title,
    required String subTitle,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        height: getVerticalSize(180),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color(0x1A000000),
                spreadRadius: 0,
                offset: Offset(0, 2),
                blurRadius: 12,
                blurStyle: BlurStyle.inner),
            BoxShadow(
                color: Color(0x29000000),
                spreadRadius: 0,
                offset: Offset(0, 2),
                blurRadius: 12,
                blurStyle: BlurStyle.outer),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: getHorizontalSize(60),
              width: getHorizontalSize(60),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: kWhiteColor,
                size: 40,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: getHorizontalSize(200),
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  color: kSubTitleColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
