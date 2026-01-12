import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/views/layout/pages/product_details/product_details.dart';
import 'package:suits/views/layout/widgets/tab_list.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  State<WishlistView> createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  final tabList = ["All", "Men", "Women", "Shoes", "Accessories", "Jewelry"];
  int tabIndex = 0;

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
              title: Text(' Hello Safia', style: theme.titleLarge),
            ),
            SliverToBoxAdapter(child: 49.ph),
            SliverToBoxAdapter(
              child: TabList(
                tabList: tabList,
                onTap: (index) {
                  setState(() {
                    tabIndex = index;
                  });
                },
                currentIndex: tabIndex,
              ),
            ),
            SliverToBoxAdapter(child: 32.ph),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
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
                            child: AppImage(
                              imageName: "pr.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10.h,
                          right: 10.w,
                          child: CircleAvatar(
                            backgroundColor: Color(
                              0xffFFFFFF,
                            ).withValues(alpha: .5),
                            child: AppImage(imageName: "heart2.png"),
                          ),
                        ),
                      ],
                    ),
                    12.ph,
                    Row(
                      children: [
                        Text(
                          "classic blazar",
                          style: theme.titleMedium!.copyWith(
                            fontSize: 14.sp,
                            fontVariations: [FontVariation('wght', 500)],
                          ),
                        ),
                        Spacer(),
                        AppImage(imageName: "star.png"),
                        Text(
                          " 5.0",
                          style: theme.titleMedium!.copyWith(
                            color: const Color(0xff979696),
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "#\$83.97",
                      style: theme.titleMedium!.copyWith(
                        color: const Color(0xffAB94A6),
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                );
              }, childCount: 10),
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
