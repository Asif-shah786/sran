import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../core/widgets/keepAliveWrapper.dart';
import '../views/tabs/home/home_view.dart';
import '../views/tabs/leader_board/leaderboard_view.dart';
import '../views/tabs/setting/setting_view.dart';

class BottomTabsController extends GetxController {
  //TODO: Implement ContactUsController

  String? uid = Get.parameters['uid'];
  RxInt currentTab = 0.obs;
  List bodyWidgets = [];

  changeTab(int index) {
    currentTab.value = index;
  }

  @override
  void onInit() {
    bodyWidgets = [
      KeepAliveWrapper(child: HomeView(),),
      KeepAliveWrapper(child: LeaderboardView(),),
      KeepAliveWrapper(child: SettingView(),),
    ];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
