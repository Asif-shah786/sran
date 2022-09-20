import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../controllers/setting_controller.dart';
import '../../../core/data/general_data.dart';
import '../../../core/utils/color_constant.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/widgets/custom_toolbar.dart';
import '../../../routes/app_pages.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backFlag: false,
        profileActive: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: getVerticalSize(100),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x1A000000),
                        spreadRadius: 0,
                        offset: Offset(0, 2),
                        blurRadius: 12,
                        blurStyle: BlurStyle.inner)
                  ]),
              child: Row(
                children: [
                  Container(
                    margin : const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Image(image: AssetImage(UserData.profileImage),),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          UserData.name,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          UserData.email,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: kSubTitleColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          UserData.phone,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            color: kSubTitleColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: getHorizontalSize(36),
                    width: getHorizontalSize(36),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: (){},
                      icon : const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: kWhiteColor,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getVerticalSize(10.00)),
            const Text(
              'General',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Column(
              children: <Widget>[

                // ListTile(
                //   dense: true,
                //   onTap: (){},
                //   leading: SvgPicture.asset('assets/icons/notification_icon.svg'),title: const Text('Notifcation',
                // style: TextStyle(
                //   color: kPrimaryColor,
                //   fontSize: 16,
                //   fontWeight: FontWeight.w400,
                // ),
                // ),
                //   trailing: const Icon(Icons.arrow_forward_ios_rounded),
                // ),
                // Transform.translate(
                //   offset: const Offset(0, -12), //adjust based on your need
                //   child: const Divider(color: kStrokeColor, thickness: 1.5, endIndent: 16, indent: 72), ),
                ListTile(
                  dense: true,
                  onTap: (){
                    Get.toNamed(Routes.INSTRUCTIONS);
                  },
                  leading: SvgPicture.asset('assets/icons/instruction_icon.svg'),title: const Text('Instruction',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                Transform.translate(
                  offset: const Offset(0, -12), //adjust based on your need
                  child: const Divider(color: kStrokeColor, thickness: 1.5, endIndent: 16, indent: 72), ),
                ListTile(
                  dense: true,
                  onTap: (){
                    Get.toNamed(Routes.CONTACT_US);
                  },                  leading: SvgPicture.asset('assets/icons/contact_us_icon.svg'),title: const Text('Contact us',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                Transform.translate(
                  offset: const Offset(0, -12), //adjust based on your need
                  child: const Divider(color: kStrokeColor, thickness: 1.5, endIndent: 16, indent: 72), ),
                ListTile(
                  dense: true,
                  onTap: (){
                    Get.toNamed(Routes.ABOUT_US);
                  },
                  leading: SvgPicture.asset('assets/icons/about_us_icon.svg'),title: const Text('About us',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                Transform.translate(
                  offset: const Offset(0, -12), //adjust based on your need
                  child: const Divider(color: kStrokeColor, thickness: 1.5, endIndent: 16, indent: 72), ),
                ListTile(
                  dense: true,
                  onTap: (){
                    final getStorage = GetStorage();
                    var name= getStorage.read('name');

                    //in the home call logout where the
                    //getStorage.erase();
                    //Get.offAllNamed(Routes.LOGIN)

                    Get.toNamed(Routes.SIGNUP);
                  },
                  leading: SvgPicture.asset('assets/icons/logout_icon.svg'),title: const Text('Logout',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                Transform.translate(
                  offset: const Offset(0, -12), //adjust based on your need
                  child: const Divider(color: kStrokeColor, thickness: 1.5, endIndent: 16, indent: 72), ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
