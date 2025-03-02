import '../core/utils/db_functions.dart';
import '/../core/models/user.dart';
import '/../core/constants/link_api.dart';
import '../core/network/dio_crud.dart';

class UserRepository {
  static Future<User?> login(Object body) async {
    final response = await Crud.post(LinkApi.login, body: body);
    try {
      var user = User.fromJson(response['result']);
      saveUserData(user: user.toString());
      return user;
    } catch (_) {
      return null;
    }
  }
}
