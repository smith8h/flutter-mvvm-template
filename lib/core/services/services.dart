import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constants/strings.dart';
import 'http_overrides.dart';

class Services extends GetxService {
  Future<Services> init() async {
    // ? services
    await Hive.initFlutter();
    await Hive.openBox(Strings.keyDb);
    await ScreenUtil.ensureScreenSize();

    // ? device
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // ? overrides
    HttpOverrides.global = MyHttpOverrides();

    // ? permissions
    await Permission.location.request();
    await Permission.camera.request();
    await Permission.photos.request();

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}
