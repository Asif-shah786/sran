import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:get/get.dart';
import 'package:sran/core/utils/color_constant.dart';
import 'package:sran/core/utils/math_utils.dart';

import '../../../controllers/home_controller.dart';
import '../../../core/services/home_service.dart';
import '../../../core/widgets/custom_toolbar.dart';
import '../../../routes/app_pages.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class UserChartData {
  UserChartData(this.days, this.duration);

  final String days;
  final double duration;
}

class HomeView extends GetWidget<HomeService> {

  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent
    // ));
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.yellow,),
      appBar: CustomAppBar(
        backFlag: false,
        profileActive: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 0),
              physics: const BouncingScrollPhysics(),
              children: [
                const Text(
                  'Hello John Doe!',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Good Morning',
                  style: TextStyle(
                    color: kSubTitleColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: getVerticalSize(10)),
                buildTodayGoalTile(),
                SizedBox(height: getVerticalSize(30)),
                Obx(() => GestureDetector(
                  onTap: (){
                    Get.bottomSheet(
                      BottomSheet(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16.0))),
                        onClosing: () {  },
                        builder: (BuildContext context) {
                          return SizedBox(
                            width : double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: TextField(
                                        textAlign : TextAlign.center,
                                        controller: Get.find<HomeService>().durationController,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(10),
                                          border: OutlineInputBorder(
                                              borderSide:
                                              const BorderSide(color: kGreyLightColor, width: 1),
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide:
                                              const BorderSide(color: kGreyLightColor, width: 1),
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          hintText: 'Duration: 1-7',
                                          helperStyle: const TextStyle(
                                            color: kGreyColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: getVerticalSize(10),),
                                    ElevatedButton(onPressed: (){
                                      print(Get.find<HomeService>().durationController.text);
                                      Get.find<HomeService>().setAndWriteCounterDuration(
                                          duration : int.parse(Get.find<HomeService>().durationController.text.trim().toString())*3600
                                      );
                                      Get.find<HomeService>().durationController.clear();
                                      Get.back();
                                    },
                                        style: TextButton.styleFrom(
                                            fixedSize: (const Size(120, 50)),
                                            textStyle: const TextStyle(
                                                color: kWhiteColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                            backgroundColor: kPrimaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            padding: const EdgeInsets.symmetric(vertical: 5)),
                                        child: const Text('Set Duration'))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    );
                  },
                  child: CircularCountDownTimer(
                        isReverse: false,
                        autoStart: Get.find<HomeService>().autoRestart.value,
                        initialDuration: Get.find<HomeService>().initialDuration.value,
                        width: double.infinity,
                        height: getVerticalSize(230),
                        duration: Get.find<HomeService>().counterDuration.value,
                        fillColor: kPrimaryColor,
                        ringColor: kStrokeColor,
                        controller: Get.find<HomeService>().countDownController,
                        backgroundColor: kScaffoldBackgroundColor,
                        strokeWidth: 25.0,
                        strokeCap: StrokeCap.round,
                        isTimerTextShown: true,
                        textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor),
                        onComplete: () => Get.find<HomeService>().onCounterComplete(),
                      ),
                )),
                SizedBox(
                  height: getVerticalSize(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getHorizontalSize(70),
                      width: getHorizontalSize(70),
                      child: Card(
                        elevation: 4.0,
                        color: kPrimaryColor,
                        shape: const CircleBorder(),
                        child: Center(
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () =>
                                Get.find<HomeService>().onCounterStart(),
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                              color: kWhiteColor,
                              size: 50.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: getHorizontalSize(10)),
                    SizedBox(
                      height: getHorizontalSize(70),
                      width: getHorizontalSize(70),
                      child: Card(
                        elevation: 4.0,
                        color: kPrimaryColor,
                        shape: const CircleBorder(),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () =>
                              Get.find<HomeService>().onCounterStop(),
                          icon: const Icon(
                            Icons.stop_rounded,
                            color: kWhiteColor,
                            size: 50.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  textAlign: TextAlign.center,
                  'Time Remaining',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(10),
                ),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    remTimeWidget(
                        hours: true,
                        todaysGoal: Get.find<HomeService>().todaysGoal.value,
                        duration:
                        Get.find<HomeService>().getDuration.toInt()),
                    SizedBox(width: getHorizontalSize(20)),
                    remTimeWidget(
                        minutes: true,
                        todaysGoal: Get.find<HomeService>().todaysGoal.value,
                        duration:
                        Get.find<HomeService>().getDuration.toInt()),
                    SizedBox(width: getHorizontalSize(20)),
                    remTimeWidget(
                        seconds: true,
                        todaysGoal: Get.find<HomeService>().todaysGoal.value,
                        duration:
                        Get.find<HomeService>().getDuration.toInt()),
                  ],
                )),
                SizedBox(height: getHorizontalSize(20)),
                const Text(
                  'Weekly Progress',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // const Text('Progress\nWeekly', style: TextStyle(
                //     fontWeight: FontWeight.w600,
                //   fontSize: 18,
                // ),),
                SizedBox(height: getHorizontalSize(10)),
                Obx(() => SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Enable legend
                    legend: Legend(isVisible: true, position: LegendPosition.bottom),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true,),
                    series: <ChartSeries<UserChartData, String>>[
                      LineSeries<UserChartData, String>(
                          color: const Color(0xffFFE4D4),
                          markerSettings: const MarkerSettings(
                              isVisible: true,
                              color: kPrimaryColor,
                              width: 8,
                              borderColor: kPrimaryColor),
                          dataSource: Get.find<HomeService>().userChartData.value,
                          xValueMapper: (UserChartData sales, _) => sales.days,
                          yValueMapper: (UserChartData sales, _) => (sales.duration/3600).toPrecision(1),
                          yAxisName: 'h',
                          xAxisName: 'd',
                          name: 'Hours',
                          // Enable data label
                          dataLabelSettings:
                          const DataLabelSettings(isVisible: true,))
                    ])),

                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     //Initialize the spark charts widget
                //     child: SfSparkLineChart.custom(
                //       //Enable the trackball
                //       trackball: SparkChartTrackball(
                //           activationMode: SparkChartActivationMode.tap),
                //       //Enable marker
                //       marker: SparkChartMarker(
                //           displayMode: SparkChartMarkerDisplayMode.all),
                //       //Enable data label
                //       labelDisplayMode: SparkChartLabelDisplayMode.all,
                //       xValueMapper: (int index) => data[index].days,
                //       yValueMapper: (int index) => data[index].hours,
                //       dataCount: 5,
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildTodayGoalTile() {
    return Container(
      height: getVerticalSize(70),
      width: double.infinity,
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kStrokeColor),
          boxShadow: const [
            BoxShadow(
              blurStyle: BlurStyle.normal,
              color: Color(0xffBCBCBC),
              blurRadius: 64.0,
              offset: Offset(0, 8),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Today\s Goal',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => SizedBox(
                    child: Text(
                      "${(Get.find<HomeService>().todaysGoal ~/ 3600).toString()} hours",
                      style: const TextStyle(
                        color: kSubTitleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )),
                  IconButton(
                    onPressed: () => Get.find<HomeService>().setDailyGoalValue(),
                    icon: const Icon(
                      Icons.edit_rounded,
                      size: 20,
                      color: kSubTitleColor,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            width: getHorizontalSize(4),
          ),
          Obx(() => ElevatedButton(
            onLongPress: null,
            onPressed: null,
            style: TextButton.styleFrom(
              backgroundColor: Get.find<HomeService>().inProgress.value ? const Color(0xffFFE4D4) : Colors.lightGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(
              Get.find<HomeService>().inProgress.value ?'In Progress' : 'Completed',
              style: TextStyle(
                color: Get.find<HomeService>().inProgress.value ? const Color(0xffFF7629) : Colors.greenAccent,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget remTimeWidget(
      {bool hours = false,
      minutes = false,
      seconds = false,
      required int duration,
      required double todaysGoal,
      }) {
    print(duration);
    double value = 0.0;
    String title = 'Nil';
    List timeRemaining = '${(Duration(seconds: (todaysGoal).toInt() - duration))}'
        .split('.')[0]
        .padLeft(8, '0')
        .split(':');
    if (hours) {
      value = double.parse(timeRemaining[0]) ;
      title = 'HOURS';
    }
    if (minutes) {
      value = double.parse(timeRemaining[1]);
      title = 'Minutes';
    }
    if (seconds) {
      value = double.parse(timeRemaining[2]);
      title = 'SECONDS';
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: getVerticalSize(52),
          width: getVerticalSize(52),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                strokeWidth: 6,
                value: value/100,
                valueColor: const AlwaysStoppedAnimation(kPrimaryColor),
                backgroundColor: kStrokeColor,
              ),
              Center(
                child: Text(value.toString()),
              ),
            ],
          ),
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(
            color: kSubTitleColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
  // if(minutes) return time[1].toString();
  // if(seconds) return time[2].toString();

}
