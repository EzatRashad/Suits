import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'widgets/card_item_widget.dart';
import 'widgets/checkout_bottom_sheet.dart';

class CardView extends StatefulWidget {
  const CardView({super.key, this.isBack = false});
  final bool isBack;

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
 

  double get totalPrice => cards.fold(0, (sum, card) => sum + (card.price * card.count));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: widget.isBack
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              )
            : SizedBox(),
        centerTitle: true,
        title: Text("My Cards", style: theme.titleLarge),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 80.h),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                itemCount: cards.length,
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
                separatorBuilder: (context, index) =>
                    Divider(color: const Color(0xffB5B5B5), height: 20.h),
              ),
            ),

            Positioned(
              bottom: 20.h,
              left: 20.w,
              right: 20.w,
              child: AppButton(
                radius: 10,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                    ),
                    builder: (context) => CheckoutBottomSheet(totalPrice: totalPrice),
                  );
                },
                title: "Proceed to Checkout",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
