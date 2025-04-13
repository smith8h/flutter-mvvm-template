import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'service/controllers/init/locale_controller.dart';
import 'core/localization/translation_controller.dart';
import 'core/constants/strings.dart';
import 'core/constants/themes.dart';
import 'core/services/bindings.dart';
import 'core/services/middle_ware.dart';
import 'core/services/services.dart';
import 'view/screens/home.dart';

void main() async {
  await initialServices();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  build(context) {
    LocaleController controller = Get.put(LocaleController());

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      ensureScreenSize: true,
      enableScaleWH: () => false,
      enableScaleText: () => false,
      builder:
          (context, child) => GetMaterialApp(
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
          ),
    );
  }
}
