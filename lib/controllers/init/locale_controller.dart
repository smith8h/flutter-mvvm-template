import 'package:hive_flutter/hive_flutter.dart';
import '/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  ThemeMode themeMode = ThemeMode.system;

  final db = Hive.box(Strings.keyDb);

  changeLang(String langCode) async {
    await db.put("lang", langCode);
    Get.updateLocale(Locale(langCode));
  }

  @override
  void onInit() {
    super.onInit();
    String? sharedPrefLang = db.get("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    String? theme = db.get("theme");
    if (theme == "dark") {
      themeMode = ThemeMode.dark;
    } else if (theme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.system;
    }

    update();
  }
}
