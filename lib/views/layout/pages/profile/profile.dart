import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/views/layout/pages/card/card.dart';
import 'package:suits/views/layout/pages/profile/pages/payment_methods.dart';
import 'package:suits/views/layout/pages/wishlist/wishlist.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<ItemModel> list = [
    ItemModel(text: "Your Profile", image: "user.png", nextPage: Scaffold()),
    ItemModel(
      text: "My Order",
      image: "menu.png",
      nextPage: CardView(isBack: true),
    ),
    ItemModel(
      text: "Payment Methods",
      image: "credit.png",
      nextPage: PaymentMethodsView(),
    ),
    ItemModel(text: "Wishlist", image: "heart.png", nextPage: WishlistView(isBack: true)),
    ItemModel(text: "Setting", image: "setting.png", nextPage: Scaffold()),
    ItemModel(text: "Log Out", image: "logout.png", nextPage: Scaffold()),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    22.ph,
                    Text(
                      "Profile",
                      style: theme.titleMedium!.copyWith(fontSize: 20.sp),
                    ),
                    41.ph,

                    CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 50.r,
                      child: Transform.scale(
                        scale: 1.3,
                        child: AppImage(
                          fit: BoxFit.fill,
                          imageName: "person.png",
                        ),
                      ),
                    ),
                    14.ph,
                    Text(
                      "Safia Ayman",
                      style: theme.titleMedium!.copyWith(fontSize: 20.sp),
                    ),
                    41.ph,
                  ],
                ),
              ),
              SliverList.separated(
                itemCount: 5,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.nextScreen(list[index].nextPage);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 19.w,
                      vertical: 17.h,
                    ),
                    child: Row(
                      children: [
                        AppImage(imageName: list[index].image),
                        18.pw,
                        Text(
                          list[index].text,
                          style: theme.titleMedium!.copyWith(fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => 25.ph,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemModel {
  final String text;
  final String image;
  final Widget nextPage;
  ItemModel({required this.text, required this.image, required this.nextPage});
}
