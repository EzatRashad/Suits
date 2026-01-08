import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';

class PhoneOrEmail extends StatelessWidget {
  const PhoneOrEmail({super.key, required this.isEmail, required this.onEmailChanged});
  final bool isEmail;
  final Function(bool) onEmailChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 3.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onEmailChanged(true),
            child: Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 53.w),
            
                decoration: BoxDecoration(
                  color: isEmail ? Color(0xFFF9FAFB) : AppColors.white,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Text(
                  "Email",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 14.sp,
                    color: isEmail ? AppColors.primary : AppColors.hintText,
                  ),
                ),
              ),
            ),
          ),
          10.pw,
          GestureDetector(
            onTap: () => onEmailChanged(false),
            child: Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 53.w),
            
                decoration: BoxDecoration(
                  color: isEmail ? AppColors.white : Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Text(
                  "Phone",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 14.sp,
                    color: isEmail ? AppColors.hintText : AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
