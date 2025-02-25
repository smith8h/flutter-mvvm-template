import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:widgets/core/models/user.dart';
import '../core/constants/strings.dart';
import 'print_value.dart';

final db = Hive.box(Strings.dbKey);

Future<void> saveUserData({String? user}) async {
  try {
    await db.put(Strings.userKey, user);
    var u = User.fromJson(jsonDecode(user!));
    saveUserTokens(accessToken: u.accessToken, refreshToken: u.refreshToken);
  } catch (e) {
    dprint('Error saving user: $e');
  }
}

Future<void> saveUserTokens({String? accessToken, String? refreshToken}) async {
  try {
    await db.put(Strings.accessKey, accessToken);
    await db.put(Strings.refreshKey, refreshToken);
  } catch (e) {
    dprint('Error saving token: $e');
  }
}
