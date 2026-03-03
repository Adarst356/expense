import 'package:expense/routes/app_pages.dart';
import 'package:expense/routes/app_routes.dart';
import 'package:expense/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: baseUrls,
    anonKey: anonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinTrack',
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splashScreen,

    );
  }
}



