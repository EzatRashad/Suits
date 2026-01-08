import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/button_widget.dart';

class SocialMediaBtn extends StatelessWidget {
  const SocialMediaBtn({
    super.key,
    required this.imageName,
    required this.title,
  });
  final String imageName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      buttonColor: AppColors.white,
      onTap: () {},
      child: Row(
        children: [
          AppImage(imageName: imageName, width: 24.w),
          52.pw,
          Text(title, style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}
