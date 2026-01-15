import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/views/layout/pages/card/widgets/card_item_widget.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key, required this.card, required this.onChanged});

  final CardItem card;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (card.count > 1) {
              card.count--;
              onChanged();
            }
          },
          child: Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(10.r)),
            child: const Icon(Icons.remove, color: AppColors.black),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text("${card.count}", style: Theme.of(context).textTheme.titleMedium),
        ),
        GestureDetector(
          onTap: () {
            card.count++;
            onChanged();
          },
          child: Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10.r)),
            child: const Icon(Icons.add, color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
