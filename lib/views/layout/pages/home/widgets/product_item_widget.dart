
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product, this.onTap});
  final Product product;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppImage(
                  imageName: product.imageName,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              5.ph,
              Text(
                product.name,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
              Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 12.sp, color: const Color(0xffAB94A6)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String imageName;
  final double price;
  final String category;

  Product({
    required this.name,
    required this.imageName,
    required this.price,
    required this.category,
  });
}

  final List<Product> allProducts = [
    Product(
      name: "Classic Blazar",
      imageName: "pr.png",
      price: 83.97,
      category: "Men",
    ),
    Product(
      name: "Leather Jacket",
      imageName: "pr.png",
      price: 120,
      category: "Men",
    ),
    Product(
      name: "Red Dress",
      imageName: "pr.png",
      price: 90,
      category: "Women",
    ),
    Product(
      name: "High Heels",
      imageName: "pr.png",
      price: 70,
      category: "Shoes",
    ),
    Product(
      name: "Gold Necklace",
      imageName: "pr.png",
      price: 150,
      category: "Jewelry",
    ),
    Product(
      name: "Scarf",
      imageName: "pr.png",
      price: 30,
      category: "Accessories",
    ),
  ];