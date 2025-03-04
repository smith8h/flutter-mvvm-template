import 'package:hive_flutter/hive_flutter.dart';
import '/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  ThemeMode themeMode = ThemeMode.system;

  final db = Hive.box(Strings.keyDb);

  changeLang(String langCode) async {
    await db.put(Strings.keyLanguage, langCode);
    Get.updateLocale(Locale(langCode));
  }

  changeTheme(ThemeMode mode) async {
    await db.put(Strings.keyTheme, mode.toString());
    themeMode = mode;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    String? sharedPrefLang = db.get(Strings.keyLanguage);
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    String? theme = db.get(Strings.keyTheme);
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
