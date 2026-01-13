import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';

class DetailsNav extends StatelessWidget {
  const DetailsNav({this.isEnable = false, super.key});
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 33.w, vertical: 12.h),

        color: AppColors.white,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.r),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.primary),
              ),
              child: AppImage(imageName: "heart.png"),
            ),
            27.pw,
            GestureDetector(
              onTap: isEnable
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to cart")),
                      );
                    }
                  : null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 65.w, vertical: 17.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(
                    alpha: isEnable ? 1 : 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  "Add To Cart",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.white,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
