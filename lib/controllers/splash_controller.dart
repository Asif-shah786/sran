import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../core/utils/constant.dart';
import '../routes/app_pages.dart';


List<dynamic> dummyData = [
  { 'duration' : '60000' , 'date' : '2022-03-01',},
  { 'duration' : '70000' , 'date' : '2022-04-02',},
  { 'duration' : '80000' , 'date' : '2022-04-04',},
  { 'duration' : '90000' , 'date' : '2022-05-10',},
  { 'duration' : '78111' , 'date' : '2022-06-13',},
  { 'duration' : '10000' , 'date' : '2022-09-14',},
  { 'duration' : '78111' , 'date' : '2022-09-15',},
  { 'duration' : '10000' , 'date' : '2022-09-16',},
  { 'duration' : '50000' , 'date' : '2022-09-17',},
  { 'duration' : '20000' , 'date' : '2022-09-14',},
  { 'duration' : '60000' , 'date' : '2022-09-23',},
  { 'duration' : '40000' , 'date' : '2022-09-25',},
  { 'duration' : '50000' , 'date' : '2022-09-27',},
];

class SplashController extends GetxController {
  //TODO: Implement SettingController
  Future checkFirstSeen() async {
    print('in check first seen');
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    final getStorage = GetStorage();
    bool _seen = (getStorage.read(introSeenId) ?? false);
    if (_seen) {
      // await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(Routes.BOTTOMNAVIGATIONTABS);
    } else {
      await getStorage.write(introSeenId, true);
      // await getStorage.write(kDailyGoalId, kDefaultDailyGoalValue);
      // await getStorage.write(kSessionId, dummyData);
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

