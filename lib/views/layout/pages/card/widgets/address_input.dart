import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/style/app_colors.dart';

class AddressInput extends StatelessWidget {
  const AddressInput({
    super.key,
    this.maxLines = 1,
    required this.controller,
    this.validator,
    required this.label,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,

      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      textInputAction: TextInputAction.next,
      cursorColor: AppColors.borderColor,
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: 15.sp,
          color: Color(0xff727272),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColors.borderColor, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),

          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(width: 1.w, color: AppColors.borderColor),
        ),
        errorMaxLines: 3,
        errorStyle: Theme.of(
          context,
        ).textTheme.titleSmall!.copyWith(color: AppColors.error),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),

          borderSide: BorderSide(color: AppColors.error, width: 1.w),
        ),
      ),
    );
  }
}
