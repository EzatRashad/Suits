import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/app_input.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/views/layout/pages/card/checkout.dart';
import 'summary_item_widget.dart';

class CheckoutBottomSheet extends StatelessWidget {
  const CheckoutBottomSheet({super.key, required this.totalPrice});

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppInput(
              controller: controller,
              hint: "Promo Code",
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  width: 88.w,
                  height: 24.h,
                  radius: 15,
                  onTap: () {},
                  title: "Apply",
                ),
              ),
            ),
            20.ph,
            SummaryItemWidget(
              title: "Sub-Total",
              price: totalPrice.toStringAsFixed(2),
            ),
            12.ph,
            SummaryItemWidget(title: "Delivery Fee", price: "0.00"),
            12.ph,
            SummaryItemWidget(title: "Discount", price: "0.00"),
            Divider(color: const Color(0xffB5B5B5), height: 20.h),
            SummaryItemWidget(
              title: "Total Cost",
              price: "\$${totalPrice.toStringAsFixed(2)}",
            ),
            AppButton(
              onTap: () {
                context.nextScreen(CheckoutView());
              },
              title: "Checkout",
            ),
          ],
        ),
      ),
    );
  }
}
