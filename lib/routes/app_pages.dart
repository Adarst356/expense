import 'package:get/get.dart';

import '../module/auth/login/login_Screen.dart';
import '../module/auth/login/login_controller.dart';
import '../module/dashboard/dashboard_controller.dart';
import '../module/dashboard/dashboard_screen.dart';
import '../module/onboarding/onboarding_controller.dart';
import '../module/onboarding/onboarding_screen.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => OnboardingController())),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() => Get.lazyPut(() => LoginController())),
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
