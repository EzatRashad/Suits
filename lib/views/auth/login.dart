import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/app_input.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/views/auth/widgets/login_or_signup.dart';
import 'package:suits/views/auth/widgets/or_divider.dart';
import 'package:suits/views/auth/widgets/social_media_btn.dart';
import 'package:suits/views/auth/widgets/success_dialog.dart';
import 'package:suits/views/auth/signup.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool obscureText = true;
  bool emailError = false;
  bool passwordError = false;

  @override
  void initState() {
    super.initState();

    emailFocusNode.addListener(() => setState(() {}));
    passwordFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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
                    'Login',
                    style: theme.titleLarge!.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.black2,
                    ),
                  ),
                  26.ph,
                  Text(
                    'Hi Welcome back, you’ve been missed',
                    style: theme.titleMedium!.copyWith(fontSize: 12.sp),
                  ),
                  39.ph,

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
                  26.ph,

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
                  10.ph,
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forgot Password?",
                        style: theme.titleMedium!.copyWith(
                          fontSize: 12.sp,
                          fontVariations: [FontVariation('wght', 500)],
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  22.ph,
                  AppButton(
                    title: "Login",
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Logging in...')),
                      //   );

                      //   print("Email: ${emailController.text}");
                      //   print("Password: ${passwordController.text}");
                      // } else {
                      //   setState(() {
                      //     emailError =
                      //         emailController.text.isEmpty ||
                      //         !emailController.text.contains("@");
                      //     passwordError =
                      //         passwordController.text.isEmpty ||
                      //         passwordController.text.length < 6;
                      //   });
                      // }
                      showDialog(
                        context: context,
                        builder: (context) => const SuccessDialog(
                          title: "Yeay! Welcome Back",
                          message:
                              'Once again you login successfully into medidoc app',
                          btnTitle: 'Go to home',
                          screen: Scaffold(),
                        ),
                      );
                    },
                  ),
                  19.ph,
                  LoginOrSignup(
                    title1: "Don't have an account?",
                    title2: "Sign Up",
                    onTap: () {
                      context.nextScreen(SignupView());
                    },
                  ),
                  21.ph,
                  OrDivider(),
                  30.ph,
                  SocialMediaBtn(
                    imageName: "google.png",
                    title: "Login with Google",
                  ),
                  10.ph,
                  SocialMediaBtn(
                    imageName: "apple.png",
                    title: "Login with Apple",
                  ),
                  10.ph,
                  SocialMediaBtn(
                    imageName: "facebook.png",
                    title: "Login with Facebook",
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
