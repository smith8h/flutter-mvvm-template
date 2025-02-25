import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/services/http_overrides.dart';
import '../constants/strings.dart';

class Services extends GetxService {
  Future<Services> init() async {
    await Hive.initFlutter();
    await Hive.openBox(Strings.dbKey);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    HttpOverrides.global = MyHttpOverrides();

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}
