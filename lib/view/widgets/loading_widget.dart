import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator().center();
  }
}
