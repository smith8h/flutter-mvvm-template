import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/constants/colors.dart';

appSnackbar({
  required String title,
  required String message,
  ContentType contentType = ContentType.success,
  bool onTop = true,
  int duration = 3,
}) {
  var messenger = ScaffoldMessenger.of(Get.context!);

  //  ? in bootom snackbar
  final bottomSnackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.transparent,
    content: AwesomeSnackbarContent(title: title, message: message, contentType: contentType),
  );

  // ? in top snackbar
  var topSnackBar = MaterialBanner(
    backgroundColor: AppColors.transparent,
    dividerColor: AppColors.transparent,
    content: AwesomeSnackbarContent(title: title, message: message, contentType: contentType, inMaterialBanner: true),
    actions: [SizedBox.shrink()],
  );

  if (onTop) {
    messenger.hideCurrentMaterialBanner();
    messenger.showMaterialBanner(topSnackBar);
  } else {
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(bottomSnackBar);
  }
  Future.delayed(Duration(seconds: duration), () => onTop ? messenger.hideCurrentMaterialBanner() : messenger.hideCurrentSnackBar());
}
