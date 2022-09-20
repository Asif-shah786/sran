import 'package:get/get.dart';
import '../controllers/bottom_tabs_controller.dart';

class BottomTabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomTabsController>(
      () => BottomTabsController(),
    );
  }
}
