import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../constants/strings.dart';

class Services extends GetxService {
  Future<Services> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    await Hive.initFlutter();
    await Hive.openBox(Strings.dbKey);

    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Services().init());
}
