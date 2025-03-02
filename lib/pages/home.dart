import 'package:flutter/material.dart';
import 'package:widgets/core/constants/themes.dart';
import 'package:widgets/core/utils/print_value.dart';
import 'package:widgets/repository/user_repository.dart';
import 'package:widgets/widgets/text_input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _requestWithDio() async {
    var tasks = await UserRepository.getCinemanaCategories();
    dprint(tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page', style: textStyles.titleSmall)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TextInput(controller: TextEditingController(), hintText: 'hintText')],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _requestWithDio, tooltip: 'Increment', child: const Icon(Icons.add)),
    );
  }
}
