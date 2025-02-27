import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

appSnackbar(String title, String message, ContentType contentType) {
  final snackBar = SnackBar(
    elevation: 2,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
      // titleTextStyle: ,
      // messageTextStyle: ,
      // color: ,
    ),
  );

  ScaffoldMessenger.of(Get.context!)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
