import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:widgets/core/models/user.dart';
import '../constants/strings.dart';
import 'print_value.dart';

final db = Hive.box(Strings.keyDb);

Future<void> saveUserData({String? user}) async {
  try {
    await db.put(Strings.keyUser, user);
    var u = User.fromJson(jsonDecode(user!));
    saveUserTokens(accessToken: u.accessToken, refreshToken: u.refreshToken);
  } catch (e) {
    dprint('Error saving user: $e');
  }
}

Future<void> saveUserTokens({String? accessToken, String? refreshToken}) async {
  try {
    await db.put(Strings.keyAccessToken, accessToken);
    await db.put(Strings.keyRefreshToken, refreshToken);
  } catch (e) {
    dprint('Error saving token: $e');
  }
}
