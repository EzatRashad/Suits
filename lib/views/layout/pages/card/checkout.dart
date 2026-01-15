import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/views/layout/pages/card/payment.dart';
import 'package:suits/views/layout/pages/card/widgets/address_item.dart';
import 'package:suits/views/layout/pages/card/widgets/card_item_widget.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
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
        title: Text("Chekout", style: theme.titleLarge),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          color: AppColors.white,
          child: AppButton(
            radius: 10,
            onTap: () {
              context.nextScreen(PaymentView());
            },
            title: "Continue to payment",
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  39.ph,
                  Text("Shipping Address", style: theme.titleLarge),
                  26.ph,
                  AddressItem(),
                  40.ph,
                  Text("Order List", style: theme.titleLarge),
                  29.ph,
                ],
              ),
            ),
            SliverList.separated(
              itemCount: cards.length,
              separatorBuilder: (context, index) =>
                  Divider(color: const Color(0xffB5B5B5), height: 20.h),
              itemBuilder: (context, index) {
                final card = cards[index];
                return CardItemWidget(
                  card: card,
                  onRemove: () {
                    setState(() => cards.removeAt(index));
                  },
                  onCountChanged: () => setState(() {}),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
