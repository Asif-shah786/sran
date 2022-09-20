import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:sran/models/timer_model.dart';

import '../utils/common.dart';

String intToTime(int value) {
  int h, m, s;
  h = value ~/ 3600;
  m = ((value - h * 3600)) ~/ 60;
  s = value - (h * 3600) - (m * 60);
  String result = "$h:$m:$s";
  return result;
}

class HomeService extends GetxService {

  CountDownController countDownController = CountDownController();
  CountDownController hoursController = CountDownController();
  CountDownController minutesController = CountDownController();
  CountDownController secondsController = CountDownController();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  GetStorage getStorage = GetStorage();
  String sessionKey = 'sessionDataKey';


  int? initialDuration;
  DateTime? startingTime;
  DateTime? pausedTime;
  RxInt? duration;
  RxBool isStarted = false.obs;


  String get getDuration =>  duration == null ? '0' : duration!.value.toString();



  String readDuration(){
    String d;
    if(getStorage.hasData(sessionKey)){
      getStorage.listenKey(sessionKey, (value) {

      });
      return '';
    }else{
      d = '0';
      return d;
    }
  }


  void writeToStorage({required int duration}) {
    print('WRITING USER DATA');
    TimerSessionData model = TimerSessionData(
      duration: duration.toString(),
      dateTime: formatter.format(DateTime.now()),
    );
    if (getStorage.hasData(sessionKey)) {
      List previousData = getStorage.read(sessionKey);
      int lastIndex = previousData.indexOf(previousData.last);
      DateTime pDate = DateTime.parse(previousData.last['date']);
      DateTime nDate = DateTime.parse(formatter.format(DateTime.now()));
      if(nDate.isSameDate(pDate)){
        previousData[lastIndex] = TimerSessionData.toMap(model);
        getStorage.write(sessionKey, previousData).whenComplete(() => customToast('Same Day Entry'));
        print("SAME DAY WRITING");
        print(getStorage.read(sessionKey));
      }
      else{
        print("DIFFERENT DAY WRITING");
        previousData.add(TimerSessionData.toMap(model));
        getStorage.write(sessionKey, previousData).whenComplete(() => customToast('Diff Day Entry'));
        print(getStorage.read(sessionKey));
      }
    }
    else{
      print("FIRST TIME WRITING");
      getStorage.write(sessionKey, [TimerSessionData.toMap(model)]).whenComplete(() => customToast('User First Entry'));
      print(getStorage.read(sessionKey));
    }
  }


  onCounterComplete (){
    print('Complete Duration: ${duration!.value.toString()}');
    writeToStorage(duration: duration!.value);
  }

  onCounterStart (){
    isStarted.value=true;
    print('ONSTART');
    if(countDownController.isPaused){
      print('Counter was Paused Previously');
      startingTime = DateTime.now();
      countDownController.resume();
      return;
    }
    if(countDownController.isStarted) {
      print('already Started');
      return;
    }
    if(!countDownController.isStarted) {
      print('Starting first Time');
      startingTime = DateTime.now();
      countDownController.start();
    }
  }
  onCounterPaused(){
    isStarted.value=false;
    if(countDownController.isPaused && !countDownController.isResumed) {
      {
        print('already Pasued  and Not Resumed');
      }
    }
        print('Paused');
        countDownController.pause();
        pausedTime = DateTime.now();
        print('Were Paused at ${pausedTime.toString()}');
        duration!.value = (pausedTime?.difference(startingTime!).inSeconds)!.toInt() + duration!.value;
    writeToStorage(duration: duration!.value);

    print('Till now duration ${duration!.value.toString()}');

    // customToast('Stop Watch Paused');
  }

  onCounterStop (){
    print('Stop challed');
    isStarted.value=false;
    print('Session Stopped Recorded');
    if(duration==null) {
      duration!.value = 0;
      writeToStorage(duration: duration!.value);
    }
    if(!countDownController.isStarted && !countDownController.isPaused &&
        !countDownController.isResumed) return;
    if(pausedTime==null) {
      duration!.value =
          (DateTime.now()?.difference(startingTime!).inSeconds)!.toInt() +
              duration!.value;
      writeToStorage(duration: duration!.value);
      print('Till now duration ${duration!.value.toString()}');
      countDownController.reset();
    }else{
      print('Till now duration ${duration!.value.toString()}');
      countDownController.reset();
      pausedTime=null;
    }

  }

  onCounterReset (){
    print('Reset challed');
    isStarted.value=false;
    print('Session Ressted Recorded');
    if(duration==null) {
      duration!.value = 0;
      writeToStorage(duration: duration!.value);
    };
    if(!countDownController.isStarted && !countDownController.isPaused &&
    !countDownController.isResumed) return;
    if(pausedTime==null) {
      duration!.value =
          (DateTime.now()?.difference(startingTime!).inSeconds)!.toInt() +
              duration!.value;
      writeToStorage(duration: duration!.value);
      print('Till now duration ${duration!.value.toString()}');
      countDownController.reset();
    }else{
      print('Till now duration ${duration!.value.toString()}');
      countDownController.reset();
      pausedTime=null;
    }
  }

  onHoursComplete (){
    // Get.showSnackbar(GetSnackBar(title: 'Done',));
  }

  onHoursStart (){
    // Get.showSnackbar(GetSnackBar(title: 'Done',));
  }
  onMinutesComplete (){
    // Get.showSnackbar(GetSnackBar(title: 'Done',));
  }

  onMinutesStart (){
    // Get.showSnackbar(GetSnackBar(title: 'Done',));
  }
  onSecondsComplete (){
    // Get.showSnackbar(GetSnackBar(title: 'Done',));
  }

  onSecondsStart (){
    // Get.showSnackbar(GetSnackBar(title: 'Done',));
  }

  @override
  void onInit() {
    print('Init Called');
    initialDuration = 0;
    duration == null ? duration = 0.obs :
    duration!.value = duration!.value
    ;
    super.onInit();
  }

  @override
  void onReady() {
    print('Ready Called');
    super.onReady();
  }

  @override
  void onClose() {
    print('Closed Called');
    super.onClose();
  }

}