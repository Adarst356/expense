import 'package:expense/routes/app_pages.dart';
import 'package:expense/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'module/auth/login/login_Screen.dart';
import 'module/dashboard/dashboard_screen.dart';
import 'module/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense',
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splashScreen,

    );
  }
}



