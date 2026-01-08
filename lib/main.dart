import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_theme.dart';
import 'package:suits/views/auth/forget_password.dart';
import 'package:suits/views/auth/new_password.dart';
import 'package:suits/views/auth/otp.dart';
import 'package:suits/views/on_boarding/get_start.dart';
import 'package:suits/views/on_boarding/on_boarding.dart';
import 'package:suits/views/splash.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: child,
        );
      },
      child: const NewPassword(),
    );
  }
}
