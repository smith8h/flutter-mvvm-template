import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/services/http_overrides.dart';
import '../constants/strings.dart';

class Services extends GetxService {
  Future<Services> init() async {
    // ? services
    await Hive.initFlutter();
    await Hive.openBox(Strings.keyDb);

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
