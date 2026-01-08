import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/core/widgets/app_input.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/views/auth/widgets/success_dialog.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode passwordFocusNode2 = FocusNode();
  bool obscureText = true;
  bool obscureText2 = true;
  bool passwordError = false;
  bool passwordError2 = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    passwordFocusNode.addListener(() => setState(() {}));
    passwordFocusNode2.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordController2.dispose();
    passwordFocusNode.dispose();
    passwordFocusNode2.dispose();
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
              "Create New Password",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 24.sp),
            ),
            11.ph,
            Text(
              "Create your new password to login",
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(fontSize: 16.sp),
            ),
            31.ph,
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
              hint: "Enter New Password",
              obscureText: obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.hintText,
                ),
                onPressed: () => setState(() => obscureText = !obscureText),
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
            16.ph,
            AppInput(
              controller: passwordController2,
              focusNode: passwordFocusNode2,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: AppImage(
                  imageName: passwordError2
                      ? "error_password.png"
                      : (passwordFocusNode2.hasFocus
                            ? "active_password.png"
                            : "password.png"),
                  width: 24.w,
                ),
              ),
              hint: "Confirm New Password",
              obscureText: obscureText2,
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText2
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.hintText,
                ),
                onPressed: () => setState(() => obscureText2 = !obscureText2),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  setState(() => passwordError2 = true);
                  return "Password too short";
                }
                setState(() => passwordError2 = false);
                return null;
              },
            ),
            20.ph,
            AppButton(
              title: "Create New Password",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const SuccessDialog(
                    title: "Password Changed",
                    message: 'Your password has been changed successfully',
                    btnTitle: 'Login',
                    screen: Scaffold(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
