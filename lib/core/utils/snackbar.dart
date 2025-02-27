import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

appSnackbar({required String title, required String message, ContentType contentType = ContentType.success}) {
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
