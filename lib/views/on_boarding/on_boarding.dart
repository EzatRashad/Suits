import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/views/auth/login.dart';
import 'package:suits/views/on_boarding/get_start.dart';

import '../../core/utils/navigate.dart';
import 'widgets/indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController pageController;

  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "on_borading1.jpg",
      "title": "Welcome To Fashion",
      "subTitle":
          "Discover a wide range of fashion categories, browse new arrivals and shop your favourites",
    },
    {
      "image": "on_borading2.jpg",
      "title": "Explore & Shop",
      "subTitle":
          "Discover the latest trends and exclusive styles from our top designers",
    },
    {"image": "on_borading1.jpg", "title": "Hi,Shop Now", "subTitle": ""},
  ];

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          itemCount: onboardingData.length,
          itemBuilder: (context, index) {
            final item = onboardingData[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 25.h),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/${item["image"]}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        context.nextScreen(const GetStartView());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 81.w,
                        height: 40.h,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: AppColors.black),
                        ),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: AppColors.black,
                            fontFamily: "aRIAL",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    item["title"]!,
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: "aRIAL",
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    item["subTitle"]!,
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: "aRIAL",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  56.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      currentPage != 0
                          ? GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(15.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xff4E6542),
                                    width: 1.w,
                                  ),
                                ),
                                child: AppImage(imageName: "arrow_back_p.png"),
                              ),
                            )
                          : SizedBox(),
                      Indicator(
                        itemCount: 3,
                        currentIndex: currentPage,
                        activeColor: AppColors.primary,
                        inactiveColor: Colors.grey.shade400,
                        dotSize: 10,
                        spacing: 10.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (currentPage == onboardingData.length - 1) {
                            context.nextScreen(const GetStartView());
                          } else {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: AppImage(imageName: "arrow.png"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
