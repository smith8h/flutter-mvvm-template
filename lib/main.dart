import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/init/locale_controller.dart';
import 'core/localization/translation_controller.dart';
import 'core/constants/strings.dart';
import 'core/constants/themes.dart';
import 'core/services/bindings.dart';
import 'core/services/middle_ware.dart';
import 'core/services/services.dart';
import 'pages/home.dart';

void main() async {
  await initialServices();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      translations: Translation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets',
      locale: controller.language,
      themeMode: controller.themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      initialBinding: InitialBindings(),
      getPages: [
        GetPage(name: Strings.pageMain, page: () => const HomePage(), middlewares: [MiddleWare()]),
      ],
    );
  }
}
