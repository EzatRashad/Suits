import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/views/layout/pages/home/widgets/banner.dart';
import 'package:suits/views/layout/pages/home/widgets/product_item_widget.dart';
import 'package:suits/views/layout/pages/product_details/product_details.dart';
import 'package:suits/views/layout/widgets/tab_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final categoriesList = [
    Model(title: "Blazar", image: "suit.png"),
    Model(title: "Shirt", image: "shirt.png"),
    Model(title: "Men Shoes", image: "men _shoes.png"),
    Model(title: "Women Shoes", image: "women _shoes.png"),
  ];

  final tabList = ["All", "Men", "Women", "Shoes", "Accessories", "Jewelry"];
  int tabIndex = 0;

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
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  children: [
                    Text(' Hello Safia', style: theme.titleLarge),
                    const Spacer(),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const AppImage(imageName: "bell.png"),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(child: AppBanner()),

            SliverToBoxAdapter(child: 18.ph),

            SliverToBoxAdapter(
              child: Row(
                children: [
                  Text("Categary", style: theme.titleLarge),
                  const Spacer(),
                  Text(
                    "See All",
                    style: theme.titleSmall!.copyWith(
                      fontSize: 15.sp,
                      color: const Color(0xff4E6542),
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: 18.ph),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 100.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.r),
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.primary),
                          ),
                          child: AppImage(
                            imageName: categoriesList[index].image,
                          ),
                        ),
                        5.ph,
                        Text(
                          categoriesList[index].title,
                          textAlign: TextAlign.center,
                          style: theme.titleLarge!.copyWith(
                            fontSize: 12.sp,
                            color: const Color(0xff676767),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => 25.pw,
                ),
              ),
            ),

            SliverToBoxAdapter(child: 18.ph),

            SliverToBoxAdapter(
              child: Text("Flash Sale", style: theme.titleLarge),
            ),
            SliverToBoxAdapter(child: 18.ph),

            SliverToBoxAdapter(
              child: TabList(
                tabList: tabList,
                currentIndex: tabIndex,
                onTap: (index) {
                  setState(() => tabIndex = index);
                },
              ),
            ),

            SliverToBoxAdapter(child: 30.ph),

            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: () => context.nextScreen(const ProductDetailsView()),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      color: AppColors.white,
                      child: AppImage(
                        imageName: filteredProducts[index].imageName,
                      ),
                    ),
                  ),
                ),
                childCount: filteredProducts.length,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 149.w / 140.h,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
              ),
            ),

            SliverToBoxAdapter(child: 20.ph),
          ],
        ),
      ),
    );
  }
}

class Model {
  final String title;
  final String image;

  Model({required this.title, required this.image});
}
