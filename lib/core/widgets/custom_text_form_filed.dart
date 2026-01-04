import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/style/app_colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.maxLines = 1,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,

      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),

      cursorColor: AppColors.borderColor,
      controller: controller,
      obscureText: obscureText,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: AppColors.primary.withOpacity(0.05),
        filled: true,
        hintText: hint,
        suffixIcon: suffixIcon,
        hintStyle: Theme.of(context).textTheme.titleSmall,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.primary.withValues(alpha: 0.3),
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),

          borderSide: BorderSide(color: AppColors.borderColor, width: 1.w),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(width: 1.w, color: AppColors.borderColor),
        ),
        errorMaxLines: 3,
        errorStyle: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: AppColors.error),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),

          borderSide: BorderSide(color: AppColors.error, width: .5.w),
        ),
      ),
    );
  }
}
