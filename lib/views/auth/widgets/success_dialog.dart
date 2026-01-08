import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/button_widget.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.title,
    required this.message,
    required this.btnTitle,
    required this.screen,
  });
  final String title;
  final String message;
  final String btnTitle;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
      backgroundColor: AppColors.white,
      title: CircleAvatar(
        radius: 38.r,
        backgroundColor: Color(0XFF_F5F8FF),
        child: AppImage(imageName: "check.svg"),
      ),
      children: [
        Align(
          alignment: AlignmentDirectional.center,
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
        16.ph,
        Text(
          textAlign: TextAlign.center,
          message,
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
        ),
        20.ph,
        AppButton(
          title: btnTitle,
          onTap: () {
            context.nextScreen(screen);
          },
        ),
      ],
    );
  }
}
