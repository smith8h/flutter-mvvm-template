import '../../core/models/user.dart';
import '../../core/constants/link_api.dart';
import '../../network_manager/dio_crud.dart';

class LoginRepository {
  final crud = Crud();

  Future<User> login(dynamic body) async {
    final response = await crud.post(LinkApi.login, body: body);
    return User.fromJson(response);
  }
}
