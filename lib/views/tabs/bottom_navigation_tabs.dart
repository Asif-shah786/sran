import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sran/core/utils/color_constant.dart';
import 'package:sran/core/widgets/custom_toolbar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:sran/views/tabs/home/home_view.dart';
import 'package:sran/views/tabs/leader_board/leaderboard_view.dart';
import 'package:sran/views/tabs/setting/export_setting_views.dart';

import '../../controllers/bottom_tabs_controller.dart';

class BottomTabs extends GetView<BottomTabsController> {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(30), topLeft: Radius.circular(30)
          ),
          boxShadow: [ //0xff9B9EA4
            BoxShadow(color: Color(0xff9B9EA4), spreadRadius: 0, blurRadius: 8, blurStyle: BlurStyle.outer),
          ],
        ),
    child: SalomonBottomBar(
      margin : const EdgeInsets.all(12),
          selectedItemColor: kPrimaryColor,
          currentIndex: controller.currentTab.value,
          onTap: (index) => controller.currentTab(index),
          items: [
            SalomonBottomBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home_icon.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/home_icon.svg',
                color: kPrimaryColor,
              ),
              title: const Text('Home'),
            ),
            SalomonBottomBarItem(
              icon: SvgPicture.asset('assets/icons/leaderboard_icon.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/leaderboard_icon.svg',
                color: kPrimaryColor,
              ),
              title: const Text('LeaderBoard'),
            ),
            SalomonBottomBarItem(
              icon: SvgPicture.asset('assets/icons/setting_icon.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/setting_icon.svg',
                color: kPrimaryColor,
              ),
              title: const Text('Setting'),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: controller.currentTab.value,
        children: <Widget>[
          controller.bodyWidgets[0],
          controller.bodyWidgets[1],
          controller.bodyWidgets[2],
        ],
      ),
    ));
  }
}
