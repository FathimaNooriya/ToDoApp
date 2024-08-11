import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'application/business_logic/home_controller.dart';
import 'application/presentation/screens/splas_screen.dart';
import 'domain/core/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: homeController.isDark.value ? darkTheme : lightTheme,
        home: SplasScreen(),
      );
    });
  }
}
