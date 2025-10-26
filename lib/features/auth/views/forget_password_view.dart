import 'package:coffee_cookies/firebase/auth/auth_method.dart';
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
                      AuthMethod.resetPassword(
                          context, formKey, emailController);
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

// void resetPassword(String email) async {
//   if (formKey.currentState!.validate()) {
//     //todo show loading
//     CustomDialog.showLoading(context: context);
//     try {
//       //todo check email is signup or not
//       await FirebaseAuth.instance.sendPasswordResetEmail(
//         email: emailController.text,
//       );
//       //todo hide loading
//       CustomDialog.hideLoading(context: context);
//       //todo show message successfully
//       CustomDialog.showMessage(
//         context: context,
//         title: AppStrings.successfully,
//         styleTitle: TextStyles.font22BrownDarkSemiBold,
//         message: AppStrings.passwordResetSent,
//         styleMessage: TextStyles.font18SecondMedium,
//         posActionName: AppStrings.ok,
//         stylePosActionName: TextStyles.font22BrownDarkSemiBold,
//         posActionClick: () {
//           Navigator.pushReplacementNamed(context, Routes.loginRouteName);
//         },
//       );
//     } on FirebaseAuthException catch (e) {
//       //todo hide loading
//       CustomDialog.hideLoading(context: context);
//       String message;
//       if (e.code == 'user-not-found') {
//         message = AppStrings.userNotFound;
//       } else if (e.code == 'invalid-email') {
//         message = AppStrings.invalidNotValid;
//       } else {
//         message = e.message ?? AppStrings.somethingWentWrong;
//       }
//       //todo show message error
//       CustomDialog.showMessage(
//         context: context,
//         title: AppStrings.error,
//         styleTitle: TextStyles.font22BrownDarkSemiBold,
//         message: message,
//         styleMessage: TextStyles.font18SecondMedium,
//         posActionName: AppStrings.ok,
//         stylePosActionName: TextStyles.font22BrownDarkSemiBold,
//       );
//     } catch (e) {
//       //todo hide loading
//       CustomDialog.hideLoading(context: context);
//       //todo show message error
//       CustomDialog.showMessage(
//         context: context,
//         title: AppStrings.error,
//         styleTitle: TextStyles.font22BrownDarkSemiBold,
//         message: e.toString(),
//         styleMessage: TextStyles.font18SecondMedium,
//         posActionName: AppStrings.ok,
//         stylePosActionName: TextStyles.font22BrownDarkSemiBold,
//       );
//     }
//   }
// }
}
