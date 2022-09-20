import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SettingController


  Future checkFirstSeen() async {
    print('in check first seen');
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final getStorage = GetStorage();
    bool _seen = (getStorage.read('seen') ?? false);
    if (_seen) {
      // await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(Routes.BOTTOMNAVIGATIONTABS);
    } else {
      await getStorage.write('seen', true);
      // await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(Routes.INTRO);
      // Navigator.of(context).pushReplacement(
      //     new MaterialPageRoute(builder: (context) => IntroScreen()));
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    checkFirstSeen();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
