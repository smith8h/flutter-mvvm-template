import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/core/constants/strings.dart';
import 'package:widgets/core/models/user.dart';

class MiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  final db = Hive.box(Strings.keyDb);

  @override
  RouteSettings? redirect(route) {
    var userJson = db.get(Strings.keyUser);
    if (userJson != null && userJson.isNotEmpty) {
      var user = User.fromJson(jsonDecode(userJson));
      return RouteSettings(name: Strings.pageMain, arguments: user);
    }
    return null;
  }
}
