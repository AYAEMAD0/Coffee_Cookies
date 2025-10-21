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

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  bool showPassword = false;
  bool showRePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.register,
          style: TextStyles.font27BrownDarkRegular,
        ),
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
                    hint: AppStrings.name,
                    controller: nameController,
                    validator: (text) => ValidatorHelper.validateName(text),
                    hintStyle: TextStyles.font16SecondMedium,
                    borderColor: AppColors.second,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 10.w),
                      child: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 20.h),
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
                  SizedBox(height: 20.h),
                  CustomTextField(
                    textStyle: TextStyles.font16SecondMedium,
                    keyboard: TextInputType.visiblePassword,
                    hint: AppStrings.rePassword,
                    controller: rePasswordController,
                    validator: (text) =>
                        ValidatorHelper.validateConfirmPassword(
                          text,
                          passwordController.text,
                        ),
                    hintStyle: TextStyles.font16SecondMedium,
                    borderColor: AppColors.second,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 10.w),
                      child: Icon(Icons.lock),
                    ),
                    obscure: showRePassword,
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: IconButton(
                        onPressed: () {
                          //todo show password
                          setState(() {
                            showRePassword = !showRePassword;
                          });
                        },
                        icon: Icon(
                          showRePassword
                              ? Icons.visibility_off_sharp
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    onPressed: () {
                      //todo logic signup
                    },
                    backgroundColor: AppColors.second,
                    text: AppStrings.createAccount,
                    styleText: TextStyles.font20WhiteMedium,
                  ),
                  SizedBox(height: 10.h),
                  AlreadyAndDoNotHaveAccount(
                    text: AppStrings.alreadyHaveAccount,
                    textButton: AppStrings.createAccount,
                    onPressed: () {
                      //todo nav into login
                      Navigator.pushNamed(context, Routes.loginRouteName);
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
