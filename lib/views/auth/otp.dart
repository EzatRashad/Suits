import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/views/auth/widgets/login_or_signup.dart';
import 'package:suits/views/auth/widgets/verify_code_fields.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpViewState();
}

class _OtpViewState extends State<Otp> {
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void onCodeChanged(String value, int index) {
    setState(() {});

    // write
    if (value.length == 1) {
      if (index < 3) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    }

    // remove
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            children: [
              64.ph,
              Text(
                "Enter Verification Code",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontSize: 24.sp),
              ),
              11.ph,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Enter code that we have sent to your number ",
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
                    ),

                    TextSpan(
                      text: "08528188***",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              31.ph,

              VerifyCodeFields(
                controllers: controllers,
                focusNodes: focusNodes,
                onCodeChanged: onCodeChanged,
              ),

              31.ph,
              AppButton(
                title: "Verify",
                onTap: () {},
                radius: 32.r,
                buttonColor: AppColors.primary,
              ),
              24.ph,
              LoginOrSignup(
                title1: "Didn’t receive the code? ",
                title2: "Resend",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
