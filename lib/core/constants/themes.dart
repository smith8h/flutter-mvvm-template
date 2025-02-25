import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/core/constants/colors.dart';

TextTheme tt = Theme.of(Get.context!).textTheme;

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: AppColors.primary),
    titleTextStyle: TextStyle(color: AppColors.primary, fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 20),
    backgroundColor: AppColors.whiteBackground,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 30, color: AppColors.primary),
    headlineMedium: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 27, color: AppColors.primary),
    headlineSmall: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.primary),
    titleLarge: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primary),
    titleMedium: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.text),
    titleSmall: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.text),
    bodyLarge: TextStyle(fontFamily: "cairo", color: AppColors.text, fontSize: 16),
    bodyMedium: TextStyle(fontFamily: "cairo", color: AppColors.text, fontSize: 14),
    bodySmall: TextStyle(fontFamily: "cairo", color: AppColors.text, fontSize: 12, fontWeight: FontWeight.bold),
    labelSmall: TextStyle(fontFamily: "cairo", fontSize: 8, color: Colors.white, fontWeight: FontWeight.w600),
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: AppColors.primary),
    titleTextStyle: TextStyle(color: AppColors.primary, fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 20),
    backgroundColor: AppColors.whiteBackground,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 30, color: AppColors.primary),
    headlineMedium: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 27, color: AppColors.primary),
    headlineSmall: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.primary),
    titleLarge: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 20, color: AppColors.primary),
    titleMedium: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.text),
    titleSmall: TextStyle(fontFamily: "cairo", fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.text),
    bodyLarge: TextStyle(fontFamily: "cairo", color: AppColors.text, fontSize: 16),
    bodyMedium: TextStyle(fontFamily: "cairo", color: AppColors.text, fontSize: 14),
    bodySmall: TextStyle(fontFamily: "cairo", color: AppColors.text, fontSize: 12, fontWeight: FontWeight.bold),
    labelSmall: TextStyle(fontFamily: "cairo", fontSize: 8, color: Colors.white, fontWeight: FontWeight.w600),
  ),
);
