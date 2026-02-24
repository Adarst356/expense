import 'package:expense/module/auth/signup/signup_controller.dart';
import 'package:expense/module/auth/signup/signup_screen.dart';
import 'package:expense/module/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../module/auth/login/login_Screen.dart';
import '../module/auth/login/login_controller.dart';
import '../module/dashboard/dashboard_controller.dart';
import '../module/dashboard/dashboard_screen.dart';
import '../module/onboarding/onboarding_controller.dart';
import '../module/onboarding/onboarding_screen.dart';
import '../module/splash/splash_controller.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () =>  SplashScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => SplashController())),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () =>  OnboardingScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => OnboardingController())),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () =>  LoginScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
    ),
   GetPage(
      name: AppRoutes.signupScreen,
      page: () =>  SignupScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => SignupController())),
    ),

    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DashboardController());
      }),
    ),
  ];
}
