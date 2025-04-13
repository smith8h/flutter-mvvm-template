import 'dart:convert';
import '../../core/utils/db_functions.dart';
import '/../core/models/user.dart';
import '/../core/constants/link_api.dart';
import '../../core/network/dio_crud.dart';

class UserRepository {
  final crud = Crud();

  Future<User?> login(Object body) async {
    final response = await crud.post(LinkApi.login, body: jsonEncode(body));
    var user = User.fromJson(response['result']);
    saveUserData(user: user.toString());
    return user;
  }
}
