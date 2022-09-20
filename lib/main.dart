import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sran/bindings/export_all_binding.dart';
import 'package:sran/core/utils/color_constant.dart';
import 'core/services/home_service.dart';
import 'routes/app_pages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initServices();
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
  runApp(const MyApp());
}

Future<void> initServices() async {
  GetStorage g = GetStorage();
  g.erase();
  print('Erasing All Data');
  print('starting services ...');
  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  await Get.putAsync<HomeService>(() async => await HomeService());
  print('All services started...');
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