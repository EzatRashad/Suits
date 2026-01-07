import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(height: 1.h, color: AppColors.hintText),
        ),
        5.pw,
        Text(
          "OR",
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
        ),
        5.pw,
        Expanded(
          child: Container(height: 1.h, color: AppColors.hintText),
        ),
      ],
    );
  }
}
