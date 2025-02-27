import 'package:get/get.dart';
import '/core/localization/languages/arabic.dart';
import '/core/localization/languages/english.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'ar': arabicTranslations, 'en': englishTranslations};
}