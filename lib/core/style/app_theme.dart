import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/style/app_colors.dart';

class AppTheme {
  static bool dTheme = false;
  static ThemeMode currentTheme = ThemeMode.light;
  static ThemeData lightTheme = ThemeData(
    fontFamily: "inter",
    scaffoldBackgroundColor: AppColors.background,

    //  primaryColor: ColorsManager.white,
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.white,
    //   elevation: 0,
    //   centerTitle: true,
    //   titleTextStyle: TextStyle(
    //     fontFamily: "montserrat",
    //     color: AppColors.black,
    //     fontSize: 19,
    //     fontWeight: FontWeight.w700,
    //   ),
    //   iconTheme: IconThemeData(
    //     color: AppColors.primary,
    //   ),
    // ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.black,
        fontVariations: [FontVariation("wght", 700)],
        fontFamily: "inter",
        fontSize: 20.sp,
      ),
      titleMedium: TextStyle(
        color: AppColors.black,
        fontVariations: [FontVariation("wght", 600)],
        fontFamily: "inter",
        fontSize: 16.sp,
      ),
      titleSmall: TextStyle(
        color: AppColors.hintText,
        fontVariations: [FontVariation("wght", 400)],
        fontFamily: "inter",
        fontSize: 13.sp,
      ),
    ),
  );
}
