import 'package:widgets/core/models/task.dart';
import '/core/constants/link_api.dart';
import '/network_manager/dio_crud.dart';

class TaskRepository {
  final crud = Crud();

  Future<List<Task>?> gatTasks() async {
    final response = await crud.get(LinkApi.leaderTasks);
    var tasks = response['data']['result'];
    return tasks;
  }
}
