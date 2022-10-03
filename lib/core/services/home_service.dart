import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:sran/core/data/general_data.dart';
import 'package:sran/core/utils/color_constant.dart';
import 'package:sran/core/utils/math_utils.dart';
import 'package:sran/models/timer_model.dart';

import '../../views/tabs/home/home_view.dart';
import '../utils/common.dart';
import '../utils/constant.dart';
import 'local_notice_service.dart';

String intToTime(int value) {
  int h, m, s;
  h = value ~/ 3600;
  m = ((value - h * 3600)) ~/ 60;
  s = value - (h * 3600) - (m * 60);
  String result = "$h:$m:$s";
  return result;
}


class HomeService extends GetxService with WidgetsBindingObserver {
  CountDownController countDownController = CountDownController();
  TextEditingController durationController = TextEditingController();
  final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
  final DateFormat dayFormatter = DateFormat('EE');
  final DateFormat timeFormatter = DateFormat('hh:mm:ss');
  GetStorage getStorage = GetStorage();

  RxDouble todaysGoal = kDefaultDailyGoalValue.obs;
  RxBool inProgress = true.obs;
  RxInt counterDuration = 0.obs;
  RxInt initialDuration = 0.obs;
  DateTime? startingTime;
  DateTime? pausedTime;
  RxInt duration = 0.obs;
  RxBool isStarted = false.obs;
  bool written = false;
  RxBool autoRestart = false.obs;
  RxInt? dailyGoal;
  RxList<UserChartData> userChartData = <UserChartData>[].obs;
  RxBool completed = false.obs;
  final service = FlutterBackgroundService();

  @override
  void onInit() {
    WidgetsBinding.instance?.addObserver(this);
    print('Init Called');
    initializedTodaysTimerDataAndDailyGoal();
    initializeCounterDuration();
    initializeChartData();
    super.onInit();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }


  @override
  void onClose() {
    durationController.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    print('Closed Called');
    super.onClose();
  }

  initializedTodaysTimerDataAndDailyGoal() {
    todaysGoal.value = getStorage.read(kDailyGoalId);
    //Initializing Todays Timer data
    List<dynamic> sessionsData = readSessionsFromStorage();
    if (sessionsData.isNotEmpty) {
      print('SessionData Is Not Empty');
      TimerSessionData lastSession =
          TimerSessionData.fromMap(sessionsData.last);
      if (dateFormatter.format(DateTime.now()) == lastSession.dateTime) {
        //Same Day
        print('Same Day Data is Recorded');
        }else{
        print('Different Day Data is Recorded');


      }
    } else {
      //Different Day
      print('Today\' Session Is Empty');
    }
    //Initializing Daily goal
    if (getStorage.hasData(kDailyGoalId)) {
      todaysGoal.value = getStorage.read(kDailyGoalId);
      print('has ID ${todaysGoal.value.toString()}');
    } else {
      getStorage.write(kDailyGoalId, kDefaultDailyGoalValue);
      todaysGoal.value = getStorage.read(kDailyGoalId);
      print('has not ID ${todaysGoal.value.toString()}');
    }
    //Initializing InProgress
    duration.value >= (todaysGoal.value)
        ? inProgress.value = false
        : inProgress.value = true;
  }

  void initializeCounterDuration() {
    if (getStorage.hasData(kCounterDurationId)) {
      counterDuration.value = getStorage.read(kCounterDurationId);
    } else {
      getStorage.write(kCounterDurationId, kDefaultCounterDurationValue);
      counterDuration.value = kDefaultCounterDurationValue;
    }
  }

  void initializeChartData() {
    List sessionDate = readSessionsFromStorage();
    List<UserChartData> userData = [];
    List lastSevenDays = [];
    List lastSevenDaysWithZero = [];
    if (sessionDate.length >= 7) {
      lastSevenDays = sessionDate
          .getRange(sessionDate.length - 7, sessionDate.length)
          .toList();
    } else {
      lastSevenDays = sessionDate;
    }
    DateTime today = DateTime.parse(dateFormatter.format(DateTime.now()));
    for (int i = 7; i > 0; i--) {
      lastSevenDaysWithZero.add({
        'duration': '0',
        'date': dateFormatter.format(today.subtract(Duration(days: i)))
      });
    }
    for (int i = 0; i < lastSevenDays.length; i++) {
      for (int j = 0; j < lastSevenDaysWithZero.length; j++) {
        if (lastSevenDays[i]['date'].toString() ==
            lastSevenDaysWithZero[j]['date']) {
          print('Matched');
          lastSevenDaysWithZero[j]['duration'] = lastSevenDays[i]['duration'];
        }
      }
    }
    for (var value in lastSevenDaysWithZero) {
      userData.add(UserChartData(
          dayFormatter.format(DateTime.parse(value['date'])),
          (double.parse(value['duration']))));
    }
    userChartData.value = userData;
    for (var value in userChartData.value) {
      print(value.duration);
    }
  }

  void setAndWriteCounterDuration({required int duration}) {
    print(duration);
    if (duration >= 0) {
      duration = 30;
      getStorage.write(kCounterDurationId, duration);
      counterDuration.value = duration;
      print('Duration Set to ${duration.toString()}');
      customToast('Duration Set to ${duration ~/ 3600} hours');
    } else {
      print('The Counter Duration is not a Digit');
    }
  }

  int get getDuration => duration == null ? 0 : duration.value;

  void writeDataToGetStorage(GetStorage getObj , String key, dynamic value){
      getObj.write(key, value);
  }
  dynamic readDataFromGetStorage(GetStorage getObj , String key, dynamic value){
    if(getObj.hasData(key)){
  return getObj.read(key);
  }
    else {
      return null;
    }
  }

  List<dynamic> readSessionsFromStorage() {
    if (!getStorage.hasData(kSessionId)) {
      return [];
    } else {
      List<dynamic> sessions = getStorage.read(kSessionId);
      return sessions;
    }
  }

  onCounterStart() async  {
    print('onCounterStart');
    print('Counter Duration  : ${counterDuration}');
    isStarted.value = true;
    print('START Pressed');
    if (countDownController.isStarted) {
      print('already Started');
      return;
    } else {
      await service.startService().then((value){
        if(value){
          print(value);
          print('Started...');
          startingTime = DateTime.now();
          countDownController.start();
          print('onCounterStart');
          print(startingTime!.toString());
          print(counterDuration.value.toString());
          service.invoke('start-timer', {
            'duration' : counterDuration.value.toString(),
            'starting-time' : startingTime.toString()
          });
        }else{
          print(value);
        }
      });


    }
  }

  onCounterStop(){
    countDownController.reset();
    service.invoke('stop-service');
  }

  onCounterComplete() {
    countDownController.reset();
  }

  void completedAction() {
    if (completed.value == true) {
      print('In completed');
      inProgress.value = false;
      startingTime = null;
      print("Current Duration  : ${duration?.value.toString()}");
      print("Today's Goal Duration : ${todaysGoal?.value.toString()}");
      print('Today\s Goal is Completed');
      Get.defaultDialog(
        title: 'Congratulations Today\'s Goal is Completed',
        content: const Text(
            'You did very Well today\nSuccess is the sum of small efforts, repeated day in and day out. – Robert Collier'),
      );
    }
  }

  setDailyGoalValue() {
    List<int> items = List.generate(15, (index) => (index + 1));
    Get.bottomSheet(
      Container(
        height: getVerticalSize(300),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                tileColor: const Color(0xffEFEFF0),
                title: Text(
                  items[index].toString(),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  // todaysGoal.value = 0.01;
                  // writeDailyGoal(0.01);
                  todaysGoal.value = 30.0;
                  writeDailyGoal(30.0);
                  // todaysGoal.value = (items[index] * 30).toDouble();
                  // writeDailyGoal((items[index] * 30).toDouble());
                  // print('Value of Default Gaol limit is Updated to ${items[index]}');
                  Get.back();
                },
              ),
            );
          },
        ),
      ),
      barrierColor: Colors.transparent,
      isDismissible: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
    );
  }

  void writeDailyGoal(double goalValue) {
    getStorage.write(kDailyGoalId, goalValue);
  }

  @override
  void onReady() {
    print('Ready Called');
    super.onReady();
  }
}
