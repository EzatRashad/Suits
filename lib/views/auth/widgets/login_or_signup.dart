import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';

class LoginOrSignup extends StatelessWidget {
  const LoginOrSignup({
    super.key,
    required this.title1,
    required this.title2,
    required this.onTap,
  });

  final String title1;
  final String title2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title1,
          style: theme.titleSmall!.copyWith(
            fontSize: 14.sp,
            color: Color(0xFF717784),
          ),
        ),
        4.pw,
        GestureDetector(
          onTap: onTap,
          child: Text(
            title2,
            style: theme.titleSmall!.copyWith(
              fontSize: 14.sp,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
