import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sran/core/utils/color_constant.dart';

import '../../routes/app_pages.dart';
import '../utils/math_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? titleText;
  bool backFlag;
  bool profileActive;

  CustomAppBar(
      {Key? key,
      this.titleText,
      required this.backFlag,
      required this.profileActive})
      : super(key: key);

  @override //56 default
  Size get preferredSize => const Size.fromHeight(106);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 106,
      flexibleSpace: const Image(
        image: AssetImage(
          'assets/images/appBar_background.png',
        ),
        fit: BoxFit.cover,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //SizedBox(width: 40, height: 0)
          !backFlag
              ? Image.asset(
            alignment : Alignment.centerLeft,
                  "assets/images/sran_logo.png",
                  color: kWhiteColor,
                  height: getVerticalSize(50),
                  width: getVerticalSize(93),
                )
              : Container(
            alignment : Alignment.centerLeft,
            height: getVerticalSize(50),
            width: getVerticalSize(93),
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: kWhiteColor,
                      size: 24,
                    ),
                  ),
              ),

          Expanded(
            child: Container(
                alignment: Alignment.center,
                height: getVerticalSize(50),
                width: getVerticalSize(93),
                child: Text(
                  titleText == null ? '' : titleText!,
                  style: const TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
                )),
          ),
          !profileActive
              ? SizedBox(width: getVerticalSize(93),height: getVerticalSize(50),
          )
              : GestureDetector(
                  onTap: () {
                    print('Goto Profile');
                    Get.toNamed(Routes.PROFILE);
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    height: getVerticalSize(50),
                    width: getVerticalSize(93),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/user_profile.png',
                      ),
                    ),
                  ),
                ),
        ],
      ),
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: kPrimaryColor),
      elevation: 0,
      backgroundColor: kPrimaryColor,
      shadowColor: Colors.grey.shade100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      centerTitle: true,
    );
  }
}



class LeaderBoardAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? titleText;
  bool backFlag;
  bool profileActive;

  LeaderBoardAppBar(
      {Key? key,
        this.titleText,
        required this.backFlag,
        required this.profileActive})
      : super(key: key);

  @override //56 default
  Size get preferredSize => const Size.fromHeight(106);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 500,
      // flexibleSpace: Image(
      //   height: getVerticalSize(400),
        // width: getVerticalSize(93),
        // image: const AssetImage(
        //   'assets/images/leaderBoard_appbar_bg.png',
        // ),
      //   fit: BoxFit.cover,
      // ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //SizedBox(width: 40, height: 0)
          // !backFlag
          //     ? Image.asset(
          //   alignment : Alignment.centerLeft,
          //   "assets/images/logo_sran_icon_border_white_fill_white_tex_fill_white_border_white.png",
          //   color: kWhiteColor,
          //   height: getVerticalSize(50),
          //   width: getVerticalSize(93),
          // )
          //     :
          // Container(
          //   alignment : Alignment.centerLeft,
          //   height: getVerticalSize(50),
          //   width: getVerticalSize(93),
          //   child: IconButton(
          //     onPressed: () {
          //       Get.back();
          //     },
          //     icon: const Icon(
          //       Icons.arrow_back_ios,
          //       color: kWhiteColor,
          //       size: 24,
          //     ),
          //   ),
          // ),
          //
          // Expanded(
          //   child: Container(
          //       alignment: Alignment.center,
          //       height: getVerticalSize(50),
          //       width: getVerticalSize(93),
          //       child: Text(
          //         titleText == null ? '' : titleText!,
          //         style: const TextStyle(
          //             color: kWhiteColor,
          //             fontSize: 20,
          //             fontWeight: FontWeight.w600),
          //       )),
          // ),
          // !profileActive
          //     ? SizedBox(width: getVerticalSize(93),height: getVerticalSize(50),
          // )
          //     : GestureDetector(
          //   onTap: () {},
          //   child: Container(
          //     alignment: Alignment.centerRight,
          //     height: getVerticalSize(50),
          //     width: getVerticalSize(93),
          //     child: const CircleAvatar(
          //       backgroundImage: AssetImage(
          //         'assets/images/user_profile.png',
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      automaticallyImplyLeading: false,
      iconTheme: const IconThemeData(color: kPrimaryColor),
      elevation: 0,
      backgroundColor: kPrimaryColor,
      shadowColor: Colors.grey.shade100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      centerTitle: true,
    );
  }
}



class MyToolBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isActive;
  final List<Widget>? actions;

  const MyToolBar({Key? key, required this.isActive, this.actions})
      : super(key: key);

  @override //56 default
  Size get preferredSize => Size.fromHeight(getVerticalSize(400));

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: kPrimaryColor));
    return AppBar(
      flexibleSpace: const Image(
      image: AssetImage("assets/images/leaderBoard_appbar_bg.png",
      ),
      fit: BoxFit.cover,
      ),
      actions: actions,
      automaticallyImplyLeading: isActive,
      iconTheme: const IconThemeData(color: kPrimaryColor),
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.grey.shade100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      centerTitle: true,
    );
  }
}
