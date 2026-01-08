import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/app_input.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/views/auth/otp.dart';
import 'package:suits/views/auth/widgets/phone_or_email.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  bool isEmail = true;

  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  bool obscureText = true;
  bool emailError = false;
  bool phoneError = false;

  @override
  void initState() {
    super.initState();

    emailFocusNode.addListener(() => setState(() {}));
    phoneFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          children: [
            64.ph,
            Text(
              "Forgot Your Password?",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 24.sp),
            ),
            11.ph,
            Text(
              "Enter your email or your phone number, we will send you confirmation code",
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
            ),
            31.ph,
            PhoneOrEmail(
              isEmail: isEmail,
              onEmailChanged: (value) => setState(() => isEmail = value),
            ),
            15.ph,
            isEmail
                ? AppInput(
                    controller: emailController,
                    focusNode: emailFocusNode,

                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: AppImage(
                        imageName: emailError
                            ? "error_email.png"
                            : (emailFocusNode.hasFocus
                                  ? "active_email.png"
                                  : "email.png"),
                        width: 24.w,
                      ),
                    ),
                    hint: "Enter your email",
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains("@")) {
                        setState(() => emailError = true);
                        return "Invalid email";
                      }
                      setState(() => emailError = false);
                      return null;
                    },
                  )
                : AppInput(
                    controller: phoneController,
                    focusNode: phoneFocusNode,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: AppImage(
                        imageName: phoneError
                            ? "phone.png"
                            : (phoneFocusNode.hasFocus
                                  ? "phone.png"
                                  : "phone.png"),
                        width: 24.w,
                      ),
                    ),
                    hint: "Enter your phone number",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() => phoneError = true);
                        return "Invalid phone number";
                      }
                      setState(() => phoneError = false);
                      return null;
                    },
                  ),
            32.ph,

            AppButton(
              title: "Reset Password",
              onTap: () {
                context.nextScreen(const OtpView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
