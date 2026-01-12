import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/utils/utils.dart';

class SizeAndColor extends StatefulWidget {
  const SizeAndColor({super.key});

  @override
  State<SizeAndColor> createState() => _SizeAndColorState();
}

class _SizeAndColorState extends State<SizeAndColor> {
  final List<String> sizes = ["S", "M", "L", "XL", "2XL"];

  final List<Color> colors = [
    Color(0xffFF0000),
    Color(0xff4E6542),
    Color(0xff323232),
    Color(0xffFFFF00),
    Color(0xff979696),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          children: [
            Text("Color:", style: theme.titleMedium),
            12.pw,

            Row(
              children: colors.map((color) {
                return Container(
                  height: 25.h,
                  width: 25.w,
                  margin: EdgeInsets.only(right: 5.w),
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        7.ph,
        Row(
          children: [
            Text("Size:", style: theme.titleMedium),
            12.pw,

            Row(
              children: sizes.map((size) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 217, 215, 215),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(size, style: theme.titleMedium),
                );
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
