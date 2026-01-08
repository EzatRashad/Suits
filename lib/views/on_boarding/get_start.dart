import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/views/auth/login.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            children: [
              11.ph,
              Row(
                children: [
                  AppImage(
                    imageName: "welcome1.png",
                    width: 137.w,
                    height: 370.h,
                  ),
                  Spacer(),
                  Column(
                    children: [
                      AppImage(
                        imageName: "welcome2.png",
                        width: 137.w,
                        height: 214.h,
                      ),
                      AppImage(
                        imageName: "welcome3.png",
                        width: 141.w,
                        height: 133.h,
                      ),
                    ],
                  ),
                ],
              ),
              33.ph,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(text: "The ", style: theme.titleLarge),
                    TextSpan(
                      text: " Suits App ",
                      style: theme.titleLarge!.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: "that\n Makes Your Look Your Best",
                      style: theme.titleLarge,
                    ),
                  ],
                ),
              ),
              24.ph,
              Text(
                "Everything you need in the world\n of fashion, old and new",
                textAlign: TextAlign.center,
                style: theme.titleMedium!.copyWith(color: Color(0XFF727272)),
              ),
              61.ph,
              AppButton(
                title: "Get Started",
                onTap: () {
                  context.nextScreen(LoginView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
