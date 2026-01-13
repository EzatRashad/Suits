import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';

class SizeItem extends StatelessWidget {
  const SizeItem({
    required this.onTap,
    required this.size,
    required this.isSelected,
    super.key,
  });
  final VoidCallback onTap;
  final String size;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : const Color.fromARGB(255, 217, 215, 215),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(size, style: theme.titleMedium),
      ),
    );
    
  }
}
