import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/core/constants/themes.dart';
import 'colors.dart';

class AppStyles {
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    padding: const EdgeInsets.symmetric(vertical: 14.0),
    shadowColor: Colors.black.withValues(alpha: 0.5),
    elevation: 8,
    minimumSize: Size(MediaQuery.of(Get.context!).size.width * .7, 50),
    textStyle: textStyles.titleMedium,
  );
}
