import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'colors.dart';

TextTheme textStyles = Theme.of(Get.context!).textTheme;

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: AppColors.primary),
    titleTextStyle: TextStyle(color: AppColors.primary, fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 20.sp),
    backgroundColor: AppColors.background,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 30.sp, color: AppColors.primary),
    headlineMedium: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 27.sp, color: AppColors.primary),
    headlineSmall: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 24.sp, color: AppColors.primary),
    titleLarge: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 20.sp, color: AppColors.primary),
    titleMedium: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 18.sp, color: AppColors.text),
    titleSmall: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 16.sp, color: AppColors.text),
    bodyLarge: TextStyle(fontFamily: "Poppins", color: AppColors.text, fontSize: 16.sp),
    bodyMedium: TextStyle(fontFamily: "Poppins", color: AppColors.text, fontSize: 14.sp),
    bodySmall: TextStyle(fontFamily: "Poppins", color: AppColors.text, fontSize: 12.sp, fontWeight: FontWeight.bold),
    labelSmall: TextStyle(fontFamily: "Poppins", fontSize: 8.sp, color: Colors.white, fontWeight: FontWeight.w600),
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
  scaffoldBackgroundColor: AppColors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: AppColors.primary),
    titleTextStyle: TextStyle(color: AppColors.primary, fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 20.sp),
    backgroundColor: AppColors.background,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 30.sp, color: AppColors.primary),
    headlineMedium: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 27.sp, color: AppColors.primary),
    headlineSmall: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 24.sp, color: AppColors.primary),
    titleLarge: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 20.sp, color: AppColors.primary),
    titleMedium: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 18.sp, color: AppColors.text),
    titleSmall: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 16.sp, color: AppColors.text),
    bodyLarge: TextStyle(fontFamily: "Poppins", color: AppColors.text, fontSize: 16.sp),
    bodyMedium: TextStyle(fontFamily: "Poppins", color: AppColors.text, fontSize: 14.sp),
    bodySmall: TextStyle(fontFamily: "Poppins", color: AppColors.text, fontSize: 12.sp, fontWeight: FontWeight.bold),
    labelSmall: TextStyle(fontFamily: "Poppins", fontSize: 8.sp, color: Colors.white, fontWeight: FontWeight.w600),
  ),
);
