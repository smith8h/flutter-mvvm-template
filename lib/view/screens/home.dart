import 'package:flutter/material.dart';
import 'package:widgets/core/constants/themes.dart';
import 'package:widgets/service/repository/task_repository.dart';
import 'package:widgets/core/utils/print_value.dart';
import 'package:widgets/view/widgets/loading_widget.dart';
import 'package:widgets/view/widgets/no_data_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _requestWithDio() async {
    var tasks = await TaskRepository().gatTasks();
    dprint(tasks);
  }
  List categories = [];
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page', style: textStyles.titleSmall)),
      floatingActionButton: FloatingActionButton(onPressed: _requestWithDio, tooltip: 'Increment', child: const Icon(Icons.add)),
      body:
          loading
              ? LoadingWidget()
              : categories.isEmpty
              ? NoDataWidget(text: 'No data found!')
              : ListView.builder(
                itemCount: categories.length,
                itemBuilder:
                    (_, index) =>
                        ListTile(leading: CircleAvatar(child: Text(categories[index]['nb'])), title: Text(categories[index]['title'])),
              ),

    );
  }
}
