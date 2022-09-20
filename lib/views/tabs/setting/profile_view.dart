import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sran/core/utils/color_constant.dart';

import '../../../controllers/about_us_controller.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/widgets/custom_toolbar.dart';

class ProfileView extends GetView<AboutUsController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Profile',
        backFlag: true,
        profileActive: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: getVerticalSize(150),
              width: getVerticalSize(150),
              child: const CircleAvatar(
                radius: 75,
                backgroundColor: kPrimaryColor,
                child: CircleAvatar(
                  radius: 68,
                  backgroundImage: AssetImage(
                    'assets/images/user_profile.png',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getVerticalSize(50),
                  ),
                  const Text('Name',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      )),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'John Doe',
                      hintStyle:
                      TextStyle(fontSize: 16.0, color: kGreyLightColor, fontWeight: FontWeight.w600),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: kGreyLightColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: kPrimaryColor, width: 1)),
                    ),
                  ),
                  Text('Email',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      )),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'john@gmail.com',
                      hintStyle:
                      TextStyle(fontSize: 16.0, color: kGreyLightColor, fontWeight: FontWeight.w600),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: kGreyLightColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: kPrimaryColor, width: 1)),
                    ),
                  ),
                  Text('Phone Number',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      )),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: '+69-2345667254',
                      hintStyle:
                      TextStyle(fontSize: 16.0, color: kGreyLightColor, fontWeight: FontWeight.w600),
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: kGreyLightColor, width: 1)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: kPrimaryColor, width: 1)),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      )
    );
  }
}


// body: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Center(
// child: Column(
// children: [
// SizedBox(height: 50,),
// Container(
// alignment: Alignment.center,
// height: getVerticalSize(150),
// width: getVerticalSize(150),
// child: const CircleAvatar(
// radius: 75,
// backgroundColor: kPrimaryColor,
// child: CircleAvatar(
// radius: 68,
// backgroundImage: AssetImage(
// 'assets/images/user_profile.png',
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.all(20.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: const [
// SizedBox(height: 50,),
// Text('Name',
// style: TextStyle(
// height: 1.2,
// wordSpacing: 1.0,
// color: kPrimaryColor,
// fontSize: 26,
// fontWeight: FontWeight.w800,
// )),
// Text('John Doe',
// overflow: TextOverflow.ellipsis,
// style: TextStyle(fontSize: 16.0, color: kGreyLightColor, fontWeight: FontWeight.w600),),
// SizedBox(height: 10,),
// Text('Email',
// style: TextStyle(
// height: 1.2,
// wordSpacing: 1.0,
// color: kPrimaryColor,
// fontSize: 26,
// fontWeight: FontWeight.w800,
// )),
// Text('johndoe98@gmail.com',
// overflow: TextOverflow.ellipsis,
// style: TextStyle(fontSize: 16.0, color: kGreyLightColor, fontWeight: FontWeight.w600),),
// SizedBox(height: 10,),
// Text('Phone Number',
// style: TextStyle(
// height: 1.2,
// wordSpacing: 1.0,
// color: kPrimaryColor,
// fontSize: 26,
// fontWeight: FontWeight.w800,
// )),
// Text('+69-2345667254',
// overflow: TextOverflow.ellipsis,
// style: TextStyle(fontSize: 16.0, color: kGreyLightColor, fontWeight: FontWeight.w600),),
// ],
// ),
// )
//
// ],
// ),
// ),
// )