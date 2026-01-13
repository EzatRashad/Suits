import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/views/layout/pages/product_details/widgets/size_item.dart';

class SizeAndColor extends StatefulWidget {
  const SizeAndColor({super.key, required this.onValueChanges});
  final ValueChanged<bool> onValueChanges;

  @override
  State<SizeAndColor> createState() => _SizeAndColorState();
}

class _SizeAndColorState extends State<SizeAndColor> {
  final List<String> sizes = ["S", "M", "L", "XL", "2XL"];
  String? selectedSize;
  Color? selectedColor;

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
                bool isSelected = selectedColor == color;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = isSelected ? null : color;
                    });
                    widget.onValueChanges(
                      selectedColor != null && selectedSize != null,
                    );
                  },
                  child: Container(
                    height: isSelected ? 40 : 25.h,
                    width: isSelected ? 40 : 25.w,
                    margin: EdgeInsets.only(right: 5.w),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : AppColors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        7.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Size:", style: theme.titleMedium),
            12.pw,

            Expanded(
              child: Wrap(
                runSpacing: 5,
                children: sizes.map((size) {
                  final isSelected = selectedSize == size;
                  return SizeItem(
                    size: size,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() => selectedSize = size);
                      widget.onValueChanges(
                        selectedSize != null && selectedColor != null,
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
