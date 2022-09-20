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

class _userData {
  _userData(this.days, this.hours);

  final String days;
  final double hours;
}


class HomeView extends GetWidget<HomeService> {

  List<_userData> data = [
    _userData('Sun', 3),
    _userData('Mon', 10),
    _userData('Tue', 3.5),
    _userData('Thur', 7),
    _userData('Fri', 5)
  ];

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
                buildGoalTile(),
                SizedBox(height: getVerticalSize(30)),
                CircularCountDownTimer(
                  isReverse: false,
                  autoStart: false,
                  initialDuration: Get.find<HomeService>().initialDuration!,
                  width: double.infinity,
                  height: getVerticalSize(230),
                  duration: 10,
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
                  onStart: () => () => Get.find<HomeService>().onCounterComplete(),
                ),
                SizedBox(height: getVerticalSize(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getHorizontalSize(50),
                      width: getHorizontalSize(50),
                      child: Card(
                        elevation: 4.0,
                        color: kHomeIconColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () => Get.find<HomeService>().onCounterReset(),
                          icon: const Icon(
                            Icons.restart_alt_rounded,
                            size: 30.0,
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
                        child: Center(
                          child: Obx(() => IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () =>
                                Get.find<HomeService>().isStarted.value ?
                                Get.find<HomeService>().onCounterPaused():
                                Get.find<HomeService>().onCounterStart(),
                            icon: Icon(
                              Get.find<HomeService>().isStarted.value ?
                              Icons.pause_rounded:
                              Icons.play_arrow_rounded,
                              color: kWhiteColor,
                              size: 50.0,
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(width: getHorizontalSize(10)),
                    SizedBox(
                      height: getHorizontalSize(50),
                      width: getHorizontalSize(50),
                      child: Card(
                        elevation: 4.0,
                        color: kHomeIconColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),),
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () => Get.find<HomeService>().onCounterStop(),
                          icon: const Icon(
                            Icons.stop_rounded,
                            size: 30.0,
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
                SizedBox(height: getVerticalSize(10),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularCountDownTimer(
                          autoStart: false,
                          initialDuration: 2000,
                          height: getVerticalSize(50),
                          width: getVerticalSize(50),
                          duration: 2000,
                          fillColor: kPrimaryColor,
                          ringColor: kPrimaryColor,
                          controller: controller.hoursController,
                          backgroundColor: kScaffoldBackgroundColor,
                          strokeWidth: 8.0,
                          strokeCap: StrokeCap.round,
                          isTimerTextShown: true,
                          isReverse: true,
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor),
                          onComplete: controller.onCounterComplete(),
                          onStart: () => controller.onCounterStart,
                        ),
                        SizedBox(height: getHorizontalSize(5)),
                        const Text(
                          textAlign: TextAlign.center,
                          'HOURS',
                          style: TextStyle(
                            color: kSubTitleColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                    SizedBox(width: getHorizontalSize(20)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularCountDownTimer(
                          autoStart: false,
                          initialDuration: 2000,
                          height: getVerticalSize(50),
                          width: getVerticalSize(50),
                          duration: 2000,
                          fillColor: kPrimaryColor,
                          ringColor: kPrimaryColor,
                          controller: controller.minutesController,
                          backgroundColor: kScaffoldBackgroundColor,
                          strokeWidth: 8.0,
                          strokeCap: StrokeCap.round,
                          isTimerTextShown: true,
                          isReverse: true,
                          textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor),
                          onComplete: controller.onCounterComplete(),
                          // onStart: controller.onCounterStart(),
                        ),
                        SizedBox(height: getHorizontalSize(5)),
                        const Text(
                          textAlign: TextAlign.center,
                          'MINUTES',
                          style: TextStyle(
                            color: kSubTitleColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: getHorizontalSize(20)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularCountDownTimer(
                          autoStart: false,
                          initialDuration: 2000,
                          height: getVerticalSize(50),
                          width: getVerticalSize(50),
                          duration: 2000,
                          fillColor: kPrimaryColor,
                          ringColor: kPrimaryColor,
                          // controller: controller.secondsController,
                          backgroundColor: kScaffoldBackgroundColor,
                          strokeWidth: 8.0,
                          strokeCap: StrokeCap.round,
                          isTimerTextShown: true,
                          isReverse: true,
                          textStyle: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor),
                          onComplete: controller.onCounterComplete(),
                          // onStart: controller.onCounterStart(),
                        ),
                        SizedBox(height: getHorizontalSize(5)),
                        const Text(
                          textAlign: TextAlign.center,
                          'SECONDS',
                          style: TextStyle(
                            color: kSubTitleColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Enable legend
                    legend: Legend(isVisible: false),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_userData, String>>[
                      LineSeries<_userData, String>(
                          color: const Color(0xffFFE4D4),
                          markerSettings: const MarkerSettings(isVisible :true, color: kPrimaryColor, width: 8, borderColor: kPrimaryColor),
                          dataSource: data,
                          xValueMapper: (_userData sales, _) => sales.days,
                          yValueMapper: (_userData sales, _) => sales.hours,
                          name: 'Time',
                          // Enable data label
                          dataLabelSettings: const DataLabelSettings(isVisible: false))
                    ]),

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

  Container buildGoalTile() {
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
              Obx(() => Text(
                Get.find<HomeService>().getDuration,
                style: const TextStyle(
                  color: kSubTitleColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )),
            ],
          ),
          SizedBox(
            width: getHorizontalSize(10),
          ),
          ElevatedButton(
            onLongPress: null,
            onPressed: null,
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xffFFE4D4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text(
              'In Progress',
              style: TextStyle(
                color: Color(0xffFF7629),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
