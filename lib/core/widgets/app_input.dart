import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/style/app_colors.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    this.maxLines = 1,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNode,
    this.validator,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
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
      focusNode: focusNode,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintStyle: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),

          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),
          borderSide: BorderSide(width: 1.w, color: AppColors.borderColor),
        ),
        errorMaxLines: 3,
        errorStyle: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: AppColors.error),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.r),

          borderSide: BorderSide(color: AppColors.error, width: 1.w),
        ),
      ),
    );
  }
}
