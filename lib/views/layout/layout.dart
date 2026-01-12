import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/views/layout/pages/home/home.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final list = [
    Model('home.svg', 'home_active.svg', () => HomeView()),
    Model(
      'cart.svg',
      'cart_active.svg',
      () => Container(color: AppColors.black2),
    ),
    Model(
      'favourite.svg',
      'favourite_active.svg',
      () => Container(color: AppColors.hintText),
    ),
    Model(
      'profile.svg',
      'profile_acive.svg',
      () => Container(color: AppColors.primary),
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: list[currentIndex].builder(),
        bottomNavigationBar: Container(
          height: 68.h,
          color: Color(0xffF9F9F9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              list.length,
              (index) => GestureDetector(
                onTap: () {
                  if (currentIndex == index) return;
                  setState(() => currentIndex = index);
                },
                child: AppImage(
                  width: 20.w,
                  height: 17.h,
                  imageName: list[index].image,
                  color: currentIndex == index
                      ? AppColors.primary
                      : AppColors.navIcon,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Model {
  final String image, activeImage;
  final Widget Function() builder;

  Model(this.image, this.activeImage, this.builder);
}
