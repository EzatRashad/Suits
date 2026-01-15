import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';

class SummaryItemWidget extends StatelessWidget {
  const SummaryItemWidget({super.key, required this.title, required this.price});
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 14.sp, color: const Color(0xff858585), fontVariations: [FontVariation('wght', 500)])),
        Text(price,
            style: TextStyle(fontSize: 14.sp, color: AppColors.black, fontVariations: [FontVariation('wght', 500)])),
      ],
    );
  }
}
