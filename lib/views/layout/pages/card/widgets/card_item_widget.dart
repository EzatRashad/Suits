import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/views/layout/pages/card/widgets/counter_widget.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    super.key,
    required this.card,
    required this.onRemove,
    required this.onCountChanged,
  });

  final CardItem card;
  final VoidCallback onRemove;
  final VoidCallback onCountChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Dismissible(
      key: ValueKey(card.title),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20.w),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        onRemove();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("${card.title} removed")));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImage(
            fit: BoxFit.fill,
            width: 121.w,
            height: 143.h,
            imageName: card.imageName,
          ),
          12.pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card.title,
                style: theme.titleMedium!.copyWith(fontSize: 14.sp),
              ),
              22.ph,
              Text(
                "Size: ${card.size}",
                style: theme.titleMedium!.copyWith(
                  fontSize: 12.sp,
                  color: const Color(0xff767676),
                ),
              ),
              15.ph,
              Text(
                "\$${card.price.toStringAsFixed(2)}",
                style: theme.titleMedium!.copyWith(
                  fontSize: 12.sp,
                  color: const Color(0xffAB94A6),
                ),
              ),
            ],
          ),
          const Spacer(),
          CounterWidget(card: card, onChanged: onCountChanged),
        ],
      ),
    );
  }
}

class CardItem {
  final String title;
  final String size;
  final String imageName;
  final double price;
  int count;

  CardItem({
    required this.title,
    required this.size,
    required this.imageName,
    required this.price,
    this.count = 1,
  });
}

List<CardItem> cards = [
  CardItem(
    title: "Classic Blazar",
    size: "XL",
    imageName: "on_borading2.jpg",
    price: 83.97,
  ),
  CardItem(
    title: "Sport Jacket",
    size: "L",
    imageName: "on_borading2.jpg",
    price: 59.99,
  ),
  CardItem(
    title: "Leather Coat",
    size: "M",
    imageName: "on_borading2.jpg",
    price: 120.50,
  ),
];
