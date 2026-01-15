import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                width: double.infinity,
                color: AppColors.white,
                child: AppImage(imageName: product.imageName, fit: BoxFit.fill),
              ),
            ),
            Positioned(
              top: 10.h,
              right: 10.w,
              child: CircleAvatar(
                backgroundColor: const Color(0xffffffff).withValues(alpha: 0.5),
                child: AppImage(imageName: "heart2.png"),
              ),
            ),
          ],
        ),
        12.ph,
        Row(
          children: [
            Text(
              product.name,
              style: theme.titleMedium!.copyWith(
                fontSize: 14.sp,
                fontVariations: [FontVariation('wght', 500)],
              ),
            ),
            const Spacer(),
            AppImage(imageName: "star.png"),
            Text(
              " ${product.rating.toStringAsFixed(1)}",
              style: theme.titleMedium!.copyWith(
                color: const Color(0xff979696),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        Text(
          "#\$${product.price.toStringAsFixed(2)}",
          style: theme.titleMedium!.copyWith(
            color: const Color(0xffAB94A6),
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}

class Product {
  final String name;
  final String imageName;
  final double price;
  final double rating;
  final String category;

  Product({
    required this.name,
    required this.imageName,
    required this.price,
    required this.rating,
    required this.category,
  });
}
