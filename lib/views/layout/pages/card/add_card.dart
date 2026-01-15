import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/views/layout/pages/card/payment.dart';
import 'package:suits/views/layout/pages/card/widgets/card_input.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final expiryController = TextEditingController();
  final cvvController = TextEditingController();
  bool isSaved = true;
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
          child: AppButton(
            radius: 10,
            onTap: () {
              context.nextScreen(PaymentView());
            },
            title: "Add Card",
          ),
        ),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 19.w),
          children: [
            20.ph,
            AppImage(imageName: "card.png"),
            20.ph,
            CardInput(
              controller: nameController,
              hintText: "Ahmed ali",
              label: "Card Holder Name",
            ),
            20.ph,
            CardInput(
              controller: numberController,
              hintText: "45284516698512695112",
              label: "Card Number",
            ),
            20.ph,
            Row(
              children: [
                Expanded(
                  child: CardInput(
                    controller: expiryController,
                    hintText: "02/30",
                    label: "Expiry Data",
                  ),
                ),
                26.pw,
                Expanded(
                  child: CardInput(
                    controller: cvvController,
                    hintText: "000",
                    label: "CVV",
                  ),
                ),
              ],
            ),
            17.ph,
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSaved = !isSaved;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(2.r),
                    decoration: BoxDecoration(
                      color: isSaved ? AppColors.primary : AppColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.check, color: AppColors.white),
                  ),
                ),
                10.pw,
                Text(
                  "Save Card",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15.sp,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            10.ph,
          ],
        ),
      ),
    );
  }
}
