import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/app_input.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/core/widgets/login_or_signup.dart';
import 'package:suits/core/widgets/or_divider.dart';
import 'package:suits/core/widgets/social_media_btn.dart';
import 'package:suits/views/auth/login.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final nameFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  bool obscureText = true;
  bool emailError = false;
  bool passwordError = false;
  bool nameError = false;

  @override
  void initState() {
    super.initState();

    emailFocusNode.addListener(() => setState(() {}));
    passwordFocusNode.addListener(() => setState(() {}));
    nameFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            children: [
              Column(
                children: [
                  11.ph,
                  Text(
                    'Sign Up',
                    style: theme.titleLarge!.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.black2,
                    ),
                  ),
                  32.ph,
                  AppInput(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: AppImage(
                        imageName: nameError
                            ? "active_name.png"
                            : (nameFocusNode.hasFocus
                                  ? "active_name.png"
                                  : "name.png"),
                        width: 24.w,
                      ),
                    ),
                    hint: "Enter your name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() => nameError = true);
                        return "Invalid name";
                      }
                      setState(() => nameError = false);
                      return null;
                    },
                  ),
                  16.ph,
                  AppInput(
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
                  ),
                  16.ph,

                  AppInput(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: AppImage(
                        imageName: passwordError
                            ? "error_password.png"
                            : (passwordFocusNode.hasFocus
                                  ? "active_password.png"
                                  : "password.png"),
                        width: 24.w,
                      ),
                    ),
                    hint: "Enter your password",
                    obscureText: obscureText,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.hintText,
                      ),
                      onPressed: () =>
                          setState(() => obscureText = !obscureText),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        setState(() => passwordError = true);
                        return "Password too short";
                      }
                      setState(() => passwordError = false);
                      return null;
                    },
                  ),
                  14.ph,
                  Row(
                    crossAxisAlignment: .start,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => isChecked = !isChecked),
                        child: Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: isChecked
                              ? Icon(
                                  Icons.check,
                                  color: AppColors.primary,
                                  size: 16.sp,
                                )
                              : null,
                        ),
                      ),
                      17.pw,
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "I agree to the medidoc ",
                              style: theme.titleSmall!.copyWith(
                                color: AppColors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: "Terms of Service",
                              style: theme.titleSmall!.copyWith(
                                color: AppColors.primary,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: " \nand ",
                              style: theme.titleSmall!.copyWith(
                                color: AppColors.black,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextSpan(
                              text: "Privacy Policy",
                              style: theme.titleSmall!.copyWith(
                                color: AppColors.primary,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  38.ph,

                  AppButton(
                    title: "Sign Up",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Logging in...')),
                        );

                        print("Email: ${emailController.text}");
                        print("Password: ${passwordController.text}");
                      } else {
                        setState(() {
                          emailError =
                              emailController.text.isEmpty ||
                              !emailController.text.contains("@");
                          passwordError =
                              passwordController.text.isEmpty ||
                              passwordController.text.length < 6;
                        });
                      }
                    },
                  ),
                  19.ph,
                  LoginOrSignup(
                    title1: "Have an account?",
                    title2: "Login",
                    onTap: () {
                      context.nextScreen(LoginView());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
