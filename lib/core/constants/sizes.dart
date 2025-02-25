import 'package:flutter/material.dart';

class AppSizes {
  static double screenHeight(context) => MediaQuery.sizeOf(context).height;
  static double screenWidth(context) => MediaQuery.sizeOf(context).width;

  static const double extraMinSpace = 5;
  static const double minSpace = 8;
  static const double midSpace = 12;
  static const double maxSpace = 16;
  static const double sectionsSpace = 24;

  static const double minBoxRadius = 10;
  static const double midBoxRadius = 16;
  static const double maxBoxRadius = 24;
  static const double extraBoxRadius = 36;

  static const double extraMinIconSize = 20;
  static const double minIconSize = 24;
  static const double midIconSize = 30;
  static const double maxIconSize = 48;
  static const double extraIconSize = 70;

  static const double minImageSize = 100;
  static const double midImageSize = 130;
  static const double maxImageSize = 170;
  static const double extraImageSize = 230;
}

class AppSpaces {
  static Widget minSpace({bool horizontal = false, double factor = 1}) {
    double space = AppSizes.minSpace * factor;
    return horizontal ? SizedBox(width: space) : SizedBox(height: space);
  }

  static Widget midSpace({bool horizontal = false, double factor = 1}) {
    double space = AppSizes.midSpace * factor;
    return horizontal ? SizedBox(width: space) : SizedBox(height: space);
  }

  static Widget maxSpace({bool horizontal = false, double factor = 1}) {
    double space = AppSizes.maxSpace * factor;
    return horizontal ? SizedBox(width: space) : SizedBox(height: space);
  }

  static Widget sectionsSpace({bool horizontal = false, double factor = 1}) {
    double space = AppSizes.sectionsSpace * factor;
    return horizontal ? SizedBox(width: space) : SizedBox(height: space);
  }
}
