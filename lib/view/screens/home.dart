import 'package:flutter/material.dart';
import 'package:widgets/core/constants/themes.dart';
import 'package:widgets/view/widgets/loading%20widget.dart';
import 'package:widgets/viewmodel/repository/user_repository.dart';
import 'package:widgets/view/widgets/no_data_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [];
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page', style: textStyles.titleSmall)),
      body:
          loading
              ? LoadingWidget()
              : categories.isEmpty
              ? NoDataWidget()
              : ListView.builder(
                itemCount: categories.length,
                itemBuilder:
                    (_, index) =>
                        ListTile(leading: CircleAvatar(child: Text(categories[index]['nb'])), title: Text(categories[index]['title'])),
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          loading = true;
          setState(() {});
          categories = await UserRepository.getCinemanaCategories();
          categories.sort((a, b) => a['title'].compareTo(b['title']));
          loading = false;
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
