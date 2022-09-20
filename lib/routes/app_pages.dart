import 'package:get/get.dart';
import 'package:sran/bindings/profile_binding.dart';
import 'package:sran/views/intro_splash/splash_view.dart';
import '../../bindings/export_all_binding.dart';
import '../bindings/bootm_tabs_binding.dart';
import '../bindings/splash_binding.dart';
import '../core/services/home_service.dart';
import '../views/account/signup_view.dart';
import '../views/account/login_view.dart';
import '../views/intro_splash/intro_view.dart';
import '../views/tabs/bottom_navigation_tabs.dart';
import '../views/tabs/home/home_view.dart';
import '../views/tabs/leader_board/leaderboard_view.dart';
import '../views/tabs/setting/export_setting_views.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static const SIGNUP = Routes.SIGNUP;
  static const SPLASH = Routes.SPLASH;
  static const HOME = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const LEADERBOARD = Routes.LEADERBOARD;
  static const SETTING = Routes.SETTING;
  static const INSTRUCTIONS = Routes.INSTRUCTIONS;
  static const CONTACT_US = Routes.CONTACT_US;
  static const ABOUT_US = Routes.ABOUT_US;
  static const LOGOUT = Routes.LOGOUT;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => const IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMTABS,
      page: () => const BottomTabs(),
      binding: BottomTabsBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LEADERBOARD,
      page: () => const LeaderboardView(),
      binding: LeaderboardBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.INSTRUCTIONS,
      page: () => const InstructionsView(),
      binding: InstructionsBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => const LogoutView(),
      binding: LogoutBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
