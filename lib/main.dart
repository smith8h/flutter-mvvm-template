import 'package:flutter/material.dart';
import 'package:widgets/app.dart';
import 'package:widgets/core/services/services.dart';

void main() async {
  await initialServices();
  runApp(const App());
}
