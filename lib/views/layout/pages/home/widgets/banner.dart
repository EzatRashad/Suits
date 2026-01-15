import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/button_widget.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 17.h),
      decoration: const BoxDecoration(color: AppColors.white),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Collection",
                  style: theme.titleLarge!.copyWith(fontSize: 16.sp),
                ),
                5.ph,
                Text(
                  "Discount 50% for\nthe first transaction",
                  style: theme.titleSmall!.copyWith(
                    fontSize: 12.sp,
                    fontVariations: const [FontVariation("wght", 500)],
                  ),
                ),
                18.ph,
                AppButton(
                  title: "Shop Now",
                  height: 29.h,
                  width: 100.w,
                  radius: 10.r,
                ),
              ],
            ),
          ),
          const Expanded(child: AppImage(imageName: "banner.png")),
        ],
      ),
    );
  }
}
