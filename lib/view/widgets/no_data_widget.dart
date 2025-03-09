import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:widgets/core/constants/strings.dart';
import 'package:widgets/core/constants/themes.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(context) {
    return [
      Image.asset(Strings.imageSittingDoodle, width: .5.sw),
      Text(text, style: textStyles.bodyLarge, textAlign: TextAlign.center),
    ].toColumn(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, separator: 8.verticalSpace).center();
  }
}
