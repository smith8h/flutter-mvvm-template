import 'package:flutter/material.dart';
import 'package:widgets/pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(title: 'Flutter Home Page'),
    );
  }
}
