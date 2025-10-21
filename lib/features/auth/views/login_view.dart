import 'package:coffee_cookies/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/validator.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../widgets/already_and_do_not_have_account.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.login, style: TextStyles.font27BrownDarkRegular),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    textStyle: TextStyles.font16SecondMedium,
                    hint: AppStrings.email,
                    controller: emailController,
                    validator: (text) => ValidatorHelper.validateEmail(text),
                    hintStyle: TextStyles.font16SecondMedium,
                    borderColor: AppColors.second,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 10.w),
                      child: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    textStyle: TextStyles.font16SecondMedium,
                    keyboard: TextInputType.visiblePassword,
                    hint: AppStrings.password,
                    controller: passwordController,
                    validator: (text) => ValidatorHelper.validatePassword(text),
                    hintStyle: TextStyles.font16SecondMedium,
                    borderColor: AppColors.second,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 10.w),
                      child: Icon(Icons.lock),
                    ),
                    obscure: showPassword,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: IconButton(
                        onPressed: () {
                          //todo show password
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(
                          showPassword
                              ? Icons.visibility_off_sharp
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        //todo forget password
                        Navigator.pushNamed(
                          context,
                          Routes.forgetPasswordRouteName,
                        );
                      },
                      child: Text(
                        AppStrings.forgetPassword,
                        style: TextStyles.font16BrownDarkBoldItalicUnderline,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  CustomButton(
                    onPressed: () {
                      //todo logic login
                    },
                    backgroundColor: AppColors.second,
                    text: AppStrings.login,
                    styleText: TextStyles.font20WhiteMedium,
                  ),
                  SizedBox(height: 10.h),
                  AlreadyAndDoNotHaveAccount(
                    text: AppStrings.donNotHaveAccount,
                    textButton: AppStrings.createAccount,
                    onPressed: () {
                      //todo nav into signup
                      Navigator.pushNamed(context, Routes.signUpRouteName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
