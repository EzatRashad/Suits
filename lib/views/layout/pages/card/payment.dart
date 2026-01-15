import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/button_widget.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("Add Card", style: theme.titleLarge),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          color: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                radius: 10,
                onTap: () {
                },
                title: "View Order",
              ),
              12.ph,
              Text(
                "View E-Receipt",
                style: theme.titleLarge!.copyWith(
                  color: AppColors.primary,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(imageName: "checked_done.png"),
            34.ph,
            Text(
              "Payment Successful!",
              style: theme.titleLarge!.copyWith(fontSize: 30.sp),
            ),
            14.ph,
            Text(
              "Your order has been placed successfully.",
              style: theme.titleLarge!.copyWith(
                fontSize: 14.sp,
                color: Color(0xff858585),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
