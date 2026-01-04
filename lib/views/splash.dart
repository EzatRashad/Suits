import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/custom_image_widget.dart';
import '../core/utils/navigate.dart';
import 'on_boarding/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
    context.nextScreen(const OnBoardingView(), replacement: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.85, end: 1.0).animate(_scaleAnimation),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppImage(imageName: "logo.png"),
                11.pw,
                Text(
                  "suits",
                  style: TextStyle(
                    fontFamily: "waterfall",
                    fontSize: 128.sp,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
