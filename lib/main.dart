import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/core/constants/strings.dart';
import 'package:widgets/core/services/services.dart';
import 'pages/home.dart';

void main() async {
  await initialServices();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      routes: {Strings.mainPage: (context) => const HomePage(title: 'Home')},
    );
  }
}
