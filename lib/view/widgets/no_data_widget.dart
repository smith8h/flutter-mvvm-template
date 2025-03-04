import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/core/constants/strings.dart';
import 'package:widgets/core/constants/themes.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Column(
        children: [
          Image.asset(Strings.imageSittingDoodle, width: .5.sw),
          12.verticalSpace,
          Text('There is no data!', style: textStyles.bodyLarge),
        ],
      ),
    );
  }
}
