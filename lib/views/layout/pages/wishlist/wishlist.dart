import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/views/layout/widgets/tab_list.dart';
import 'widgets/product_item_widget.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({ super.key, this.isBack=false});
  final bool isBack;

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final tabList = ["All", "Men", "Women", "Shoes", "Accessories", "Jewelry"];
  int tabIndex = 0;

  final List<Product> allProducts = [
    Product(
      name: "Classic Blazar",
      imageName: "pr.png",
      price: 83.97,
      rating: 5.0,
      category: "Men",
    ),
    Product(
      name: "Leather Jacket",
      imageName: "pr.png",
      price: 120.0,
      rating: 4.5,
      category: "Men",
    ),
    Product(
      name: "Red Dress",
      imageName: "pr.png",
      price: 90.0,
      rating: 4.8,
      category: "Women",
    ),
    Product(
      name: "High Heels",
      imageName: "pr.png",
      price: 70.0,
      rating: 4.6,
      category: "Shoes",
    ),
    Product(
      name: "Gold Necklace",
      imageName: "pr.png",
      price: 150.0,
      rating: 5.0,
      category: "Jewelry",
    ),
    Product(
      name: "Scarf",
      imageName: "pr.png",
      price: 30.0,
      rating: 4.2,
      category: "Accessories",
    ),
  ];

  List<Product> get filteredProducts {
    if (tabIndex == 0) return allProducts;
    final selectedCategory = tabList[tabIndex];
    return allProducts.where((p) => p.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: 20.ph),
            SliverAppBar(
              backgroundColor: AppColors.background,
              centerTitle: true,
              leading: Padding(
                padding: const EdgeInsets.all(15.0),
                child: AppImage(imageName: "arrow_back.svg"),
              ),
              title: Text('Hello Safia', style: theme.titleLarge),
            ),
            SliverToBoxAdapter(child: 49.ph),
            SliverToBoxAdapter(
              child: TabList(
                tabList: tabList,
                currentIndex: tabIndex,
                onTap: (index) => setState(() => tabIndex = index),
              ),
            ),
            SliverToBoxAdapter(child: 32.ph),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ProductItemWidget(product: filteredProducts[index]);
              }, childCount: filteredProducts.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                childAspectRatio: 0.65,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
