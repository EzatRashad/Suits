import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/style/app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final String? fontFamily;
  final double width, height, radius;
  final Widget? child;
  final Gradient? gradient;
  final double? fontSize;
  final FontWeight? fontweight;
  final Alignment? alignment;
  final Color? textColor, buttonColor, borderColor;
  final void Function()? onTap;
  final bool withBorder;
  final List<FontVariation>? fontVariations;

  const AppButton({
    super.key,
    this.gradient,
    this.title = "OK",
    this.width = double.infinity,
    this.height = 56.0,
    this.onTap,
    this.fontFamily,
    this.child,
    this.fontSize,
    this.fontweight,
    this.alignment,
    this.textColor = Colors.white,
    this.buttonColor,
    this.borderColor,
    this.withBorder = false,
    this.radius = 32.0,
    this.fontVariations,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      // height: height,
      decoration: BoxDecoration(
        // gradient: gradient,
        borderRadius: BorderRadius.circular(radius.r),
      ),
      constraints: BoxConstraints(minWidth: width, minHeight: height.h),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            buttonColor ?? AppColors.primary,
          ),
          overlayColor: WidgetStateProperty.all<Color>(AppColors.transparent),
          shadowColor: WidgetStateProperty.all<Color>(AppColors.transparent),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r),
              side: withBorder
                  ? BorderSide(color: borderColor ?? AppColors.primary)
                  : BorderSide(color: AppColors.transparent),
            ),
          ),
        ),
        child:
            child ??
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize ?? 16.sp,
                fontVariations: fontVariations ?? [FontVariation('wght', 700)],
                fontFamily: fontFamily ?? "Inter",
                color: textColor ?? AppColors.white,
              ),
            ),
      ),
    );
  }
}
