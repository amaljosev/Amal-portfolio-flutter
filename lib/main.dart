import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myportfolio/core/colors/appcolors.dart';
import 'package:myportfolio/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColors.primaryBackground,
        appBarTheme: const AppBarTheme(
            color: AppColors.secondaryBackground,
            foregroundColor: AppColors.textLight),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ScreenHome(),
    );
  }
}
