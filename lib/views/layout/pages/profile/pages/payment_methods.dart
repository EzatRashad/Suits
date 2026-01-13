import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/app_input.dart';

class PaymentMethodsView extends StatefulWidget {
  const PaymentMethodsView({super.key});

  @override
  State<PaymentMethodsView> createState() => _PaymentMethodsViewState();
}

class _PaymentMethodsViewState extends State<PaymentMethodsView> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Payment Methods",
          style: theme.titleMedium!.copyWith(fontSize: 20.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            23.ph,
            Text("Payment Methods", style: theme.titleMedium),
            26.ph,
            AppInput(
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  left: 22.0.w,
                  right: 8.h,
                  top: 8.h,
                  bottom: 8.h,
                ),
                child: AppImage(imageName: "credit.png"),
              ),
              controller: controller,
              hint: "Add Card",
            ),
            
          ],
        ),
      ),
    );
  }
}
