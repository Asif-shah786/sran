import 'dart:ui';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sran/bindings/export_all_binding.dart';
import 'package:sran/core/utils/color_constant.dart';
import 'core/services/home_service.dart';
import 'core/services/local_notice_service.dart';
import 'models/my_storage_model.dart';
import 'routes/app_pages.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';


void writeDataToGetStorage(GetStorage getObj, String key, dynamic value) {
  getObj.write(key, value);
}

dynamic readDataFromGetStorage(GetStorage getObj, String key, dynamic value) {
  if (getObj.hasData(key)) {
    return getObj.read(key);
  } else {
    return null;
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initializeService();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // statusBarColor: kScaffoldBgColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await LocalNoticeService().setup();
  runApp(const MyApp());
}

Future<void> initializeService() async {
  // GetStorage g = GetStorage();
  // g.erase();
  // print('Erasing All Data');
  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.putAsync<HomeService>(() async => await HomeService());

  ////BACKGROUND SERVICES

  final service = FlutterBackgroundService();

  /// OPTIONAL, using custom notification channel id
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground', // id
    'MY FOREGROUND SERVICE', // title
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.high, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // if (Platform.isIOS) {
  //   await flutterLocalNotificationsPlugin.initialize(
  //     const InitializationSettings(
  //       iOS: IOSInitializationSettings(),
  //     ),
  //   );
  // }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,
      // auto start service
      //autoStart: true,
      isForegroundMode: true,
      //
      // notificationChannelId: 'my_foreground',
      // initialNotificationTitle: 'AWESOME SERVICE',
      // initialNotificationContent: 'Initializing',
      // foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      // auto start service
      // autoStart: true,

      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,

      // you have to enable background fetch capability on xcode project
      onBackground: onIosBackground,
    ),
  );
  service.startService();
}

// to ensure this is executed
// run app from xcode, then from xcode menu, select Simulate Background Fetch

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.reload();
  final log = preferences.getStringList('log') ?? <String>[];
  log.add(DateTime.now().toIso8601String());
  await preferences.setStringList('log', log);

  return true;
}


@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  print('Background Service Started.....');
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();

  // For flutter prior to version 3.0.0
  // We have to register the plugin manually

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString("hello", "world");

  /// OPTIONAL when use custom notification
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();


  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });

    service.on('stop-service').listen((event) {
      print('stop-service invoked');
      service.stopSelf();
      print('background Service is Stopped');
    });



    service.on('start-timer').listen((event) {
      int duration = int.parse(event!['duration']);
      print('Passed Duration  : $duration');
      print('In Service : Start Timer Invoked');
      Timer.periodic(Duration(seconds: duration), (timer) {
        print('Timer Is Completed');
        flutterLocalNotificationsPlugin.show(
          888,
          'SRAN APP',
          'Timer Completed SERVICE}',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'Timer Completed SERVICE',
              'Timer Completed SERVICE',
              icon: 'ic_bg_service_small',
              ongoing: false,
              autoCancel: false,
            ),
          ),
        );
      });
      //Notification Shown

      //Writing Data to Storage
      StorageModel.writeSessionsToStorage(duration: duration);
    });
  }

  // bring to foreground
//   service.setForegroundMode(true);
//   Timer.periodic(Duration(seconds: 1), (timer) async {
//     if (!(await service.isServiceRunning())) timer.cancel();
//     service.setNotificationInfo(
//       title: "My App Service",
//       content: "Updated at ${DateTime.now()}",
//     );
//
//     service.sendData(
//       {"current_date": DateTime.now().toIso8601String()},
//     );
//   });
// }
//
//


  // service.on('stop-timer').listen((event) {
  //   print('stop-timer');
  // });


  // service.on('completed').listen((event) {
  //   print('|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||');
  //   print('Completed Triggered');
  //   flutterLocalNotificationsPlugin.show(
  //     888,
  //     'Timer Completed SERVICE',
  //     'Timer Completed SERVICE}',
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'Timer Completed SERVICE',
  //         'Timer Completed SERVICE',
  //         icon: 'ic_bg_service_small',
  //         ongoing: false,
  //       ),
  //     ),
  //   );
  //   service.stopSelf();
  // });

  // bring to foreground
  // Timer.periodic(const Duration(seconds: 1), (timer) async {
  //   if (service is AndroidServiceInstance) {
  //     if (await service.isForegroundService()) {
  //       /// OPTIONAL for use custom notification
  //       /// the notification id must be equals with AndroidConfiguration when you call configure() method.
  //       flutterLocalNotificationsPlugin.show(
  //         888,
  //         'COOL SERVICE',
  //         'Awesome ${DateTime.now()}',
  //         const NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             'my_foreground',
  //             'MY FOREGROUND SERVICE',
  //             icon: 'ic_bg_service_small',
  //             ongoing: true,
  //           ),
  //         ),
  //       );
  //
  //       // if you don't using custom notification, uncomment this
  //       // service.setForegroundNotificationInfo(
  //       //   title: "My App Service",
  //       //   content: "Updated at ${DateTime.now()}",
  //       // );
  //     }
  //   }
  //
  //   /// you can see this log in logcat
  //   print('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');
  //
  //   // test using external plugin
  //   final deviceInfo = DeviceInfoPlugin();
  //   String? device;
  //   if (Platform.isAndroid) {
  //     final androidInfo = await deviceInfo.androidInfo;
  //     device = androidInfo.model;
  //   }
  //
  //   if (Platform.isIOS) {
  //     final iosInfo = await deviceInfo.iosInfo;
  //     device = iosInfo.model;
  //   }
  //
  //   service.invoke(
  //     'update',
  //     {
  //       "current_date": DateTime.now().toIso8601String(),
  //       "device": device,
  //     },
  //   );
  // });
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      theme: ThemeData(
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
        fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      // theme: AppStyling.styling,
      title: 'SRAN',
      themeMode: ThemeMode.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}