import 'package:get/get.dart';
import '../core/services/home_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.find<HomeService>();
  }
}
