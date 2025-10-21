import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_asset.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/helper/validator.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordView> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.forgetPasswordPage,
          style: TextStyles.font27BrownDarkRegular,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppAsset.forgetPassword, height: 250.h),
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
                  CustomButton(
                    onPressed: () {
                      //todo logic reset password
                    },
                    backgroundColor: AppColors.second,
                    text: AppStrings.resetPassword,
                    styleText: TextStyles.font20WhiteMedium,
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
