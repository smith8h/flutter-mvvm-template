import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../network_manager/dio_injection.dart';
import '../../core/services/http_overrides.dart';
import '../constants/strings.dart';

class Services extends GetxService {
  late Dio dio;
  Future<Services> init() async {
    await Hive.initFlutter();
    await Hive.openBox(Strings.dbKey);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    HttpOverrides.global = MyHttpOverrides();
    dio = getDio();

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}
