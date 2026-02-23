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
      home:LoginScreen()
    );
  }
}



