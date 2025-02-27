import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/core/constants/colors.dart';

appSnackbar({required String title, required String message, ContentType contentType = ContentType.success}) {
  //  ? in bootom snackbar
  // final snackBar = SnackBar(
  //   behavior: SnackBarBehavior.floating,
  //   backgroundColor: AppColors.transparent,
  //   content: AwesomeSnackbarContent(
  //     title: title,
  //     message: message,
  //     contentType: contentType,
  //     // titleTextStyle: ,
  //     // messageTextStyle: ,
  //     // color: ,
  //   ),
  // );

  // ? in top snackbar
  var snackBar = MaterialBanner(
    backgroundColor: AppColors.transparent,
    forceActionsBelow: true,
    content: AwesomeSnackbarContent(title: title, message: message, contentType: contentType, inMaterialBanner: true),
    actions: [SizedBox.shrink()],
  );

  ScaffoldMessenger.of(Get.context!)
    ..hideCurrentSnackBar()
    // ..showSnackBar(snackBar);
    ..showMaterialBanner(snackBar);
}
