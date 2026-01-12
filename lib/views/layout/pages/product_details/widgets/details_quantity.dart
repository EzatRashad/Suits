import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';

class DetailsQuantity extends StatefulWidget {
  const DetailsQuantity({super.key});

  @override
  State<DetailsQuantity> createState() => _DetailsQuantityState();
}

class _DetailsQuantityState extends State<DetailsQuantity> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Row(
      children: [
        Text("Quality", style: theme.titleMedium),
        36.pw,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    quantity > 1 ? quantity-- : quantity;
                  });
                },
                child: Icon(Icons.remove),
              ),
              22.pw,
              Text(quantity.toString(), style: theme.titleMedium),
              22.pw,
              GestureDetector(
                onTap: () {
                  setState(() {
                    quantity++;
                  });
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
