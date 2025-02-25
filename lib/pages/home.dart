import 'package:flutter/material.dart';
import 'package:widgets/utils/print_value.dart';
import '../network_manager/repository/user_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _requestWithDio() async {
    var user = await UserRepository().login({"email": 'to', "password": '2222'});
    dprint(user?.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [])),
      floatingActionButton: FloatingActionButton(onPressed: _requestWithDio, tooltip: 'Increment', child: const Icon(Icons.add)),
    );
  }
}
