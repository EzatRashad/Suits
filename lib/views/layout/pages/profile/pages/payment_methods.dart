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

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 65.w, vertical: 17.h),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              textAlign: TextAlign.center,
              "Confirm Payment",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
              ),
            ),
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
                hint: "Confirm Payment",
              ),
              22.ph,
              Text("More Payment Options", style: theme.titleMedium),
              22.ph,

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    PaymentOptionItem(
                      value: 0,
                      groupValue: selectedIndex,
                      title: "Paypal",
                      image: "paypal.png",
                      onChanged: (value) {
                        setState(() => selectedIndex = value);
                      },
                    ),
                    Divider(color: AppColors.borderColor),

                    PaymentOptionItem(
                      value: 1,
                      groupValue: selectedIndex,
                      title: "Apple Pay",
                      image: "apple.png",
                      onChanged: (value) {
                        setState(() => selectedIndex = value);
                      },
                    ),
                    Divider(color: AppColors.borderColor),

                    PaymentOptionItem(
                      value: 2,
                      groupValue: selectedIndex,
                      title: "Google",
                      image: "google.png",
                      onChanged: (value) {
                        setState(() => selectedIndex = value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentOptionItem extends StatelessWidget {
  const PaymentOptionItem({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.image,
  });

  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.r),
        child: Row(
          children: [
            AppImage(imageName: image),
            12.pw,
            Text(
              title,
              style: theme.titleMedium!.copyWith(
                fontSize: 14.sp,
                color: const Color(0XFF858585),
              ),
            ),
            const Spacer(),
            Radio<int>(
              activeColor: AppColors.primary,
              value: value,
              groupValue: groupValue,
              onChanged: (val) => onChanged(val!),
            ),
          ],
        ),
      ),
    );
  }
}
