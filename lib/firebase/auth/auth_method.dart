import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../core/constants/app_strings.dart';
import '../../core/helper/custom_dialog.dart';
import '../../core/routing/routes.dart';
import '../../core/theme/app_styles.dart';

class AuthMethod {
  static void login(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    if (formKey.currentState!.validate()) {
      //todo show loading
      CustomDialog.showLoading(context: context);

      try {
        var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        var user = credential.user;
        await user?.reload();

        if (user != null && user.emailVerified) {
          //todo hide loading
          CustomDialog.hideLoading(context: context);

          //todo show success message
          CustomDialog.showMessage(
            context: context,
            title: AppStrings.successfully,
            styleTitle: TextStyles.font22BrownDarkSemiBold,
            message: AppStrings.loginSuccessfully,
            styleMessage: TextStyles.font18SecondMedium,
            posActionName: AppStrings.ok,
            stylePosActionName: TextStyles.font22BrownDarkSemiBold,
            posActionClick: () {
              //todo navigate to dashboard
              Navigator.pushReplacementNamed(
                  context, Routes.dashboardRouteName);
            },
          );
        } else {
          await user?.sendEmailVerification();
          //todo hide loading
          CustomDialog.hideLoading(context: context);
          //todo show verification message
          CustomDialog.showMessage(
            context: context,
            title: AppStrings.emailNotVerified,
            styleTitle: TextStyles.font22BrownDarkSemiBold,
            message: AppStrings.verifyEmailMessage,
            styleMessage: TextStyles.font18SecondMedium,
            posActionName: AppStrings.ok,
            stylePosActionName: TextStyles.font22BrownDarkSemiBold,
          );

          await FirebaseAuth.instance.signOut();
        }
      } on FirebaseAuthException catch (e) {
        //todo hide loading
        CustomDialog.hideLoading(context: context);
        String errorMessage = AppStrings.somethingWentWrong;
        if (e.code == 'invalid-credential') {
          errorMessage = AppStrings.incorrectEmailOrPassword;
        }
        //todo show error message
        CustomDialog.showMessage(
          context: context,
          title: AppStrings.error,
          styleTitle: TextStyles.font22BrownDarkSemiBold,
          message: errorMessage,
          styleMessage: TextStyles.font18SecondMedium,
          posActionName: AppStrings.ok,
          stylePosActionName: TextStyles.font22BrownDarkSemiBold,
        );
      } catch (e) {
        //todo hide loading
        CustomDialog.hideLoading(context: context);
        //todo  error message
        CustomDialog.showMessage(
          context: context,
          title: AppStrings.error,
          styleTitle: TextStyles.font22BrownDarkSemiBold,
          message: e.toString(),
          styleMessage: TextStyles.font18SecondMedium,
          posActionName: AppStrings.ok,
          stylePosActionName: TextStyles.font22BrownDarkSemiBold,
        );
      }
    }
  }

  static void signup(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    if (formKey.currentState!.validate()) {
      //todo show loading
      CustomDialog.showLoading(context: context);
      try {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        await credential.user!.sendEmailVerification();
        //todo hide loading
        CustomDialog.hideLoading(context: context);
        //todo show message successfully
        CustomDialog.showMessage(
          context: context,
          title: AppStrings.successfully,
          styleTitle: TextStyles.font22BrownDarkSemiBold,
          message:
              '${AppStrings.verificationEmailSent} ${emailController.text} ${AppStrings.checkInbox}',
          styleMessage: TextStyles.font18SecondMedium,
          posActionName: AppStrings.ok,
          stylePosActionName: TextStyles.font22BrownDarkSemiBold,
          posActionClick: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.loginRouteName,
              (route) => false,
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          //todo hide loading
          CustomDialog.hideLoading(context: context);
          //todo show message error
          CustomDialog.showMessage(
            context: context,
            title: AppStrings.error,
            styleTitle: TextStyles.font22BrownDarkSemiBold,
            message: AppStrings.weakPassword,
            styleMessage: TextStyles.font18SecondMedium,
            posActionName: AppStrings.ok,
            stylePosActionName: TextStyles.font22BrownDarkSemiBold,
          );
        } else if (e.code == 'email-already-in-use') {
          //todo hide loading
          CustomDialog.hideLoading(context: context);
          //todo show message error
          CustomDialog.showMessage(
            context: context,
            title: AppStrings.error,
            styleTitle: TextStyles.font22BrownDarkSemiBold,
            message: AppStrings.emailAlreadyExists,
            styleMessage: TextStyles.font18SecondMedium,
            posActionName: AppStrings.ok,
            stylePosActionName: TextStyles.font22BrownDarkSemiBold,
          );
        }
      } catch (e) {
        //todo hide loading
        CustomDialog.hideLoading(context: context);
        //todo show message error
        CustomDialog.showMessage(
          context: context,
          title: AppStrings.error,
          styleTitle: TextStyles.font22BrownDarkSemiBold,
          message: e.toString(),
          styleMessage: TextStyles.font18SecondMedium,
          posActionName: AppStrings.ok,
          stylePosActionName: TextStyles.font22BrownDarkSemiBold,
        );
      }
    }
  }

  static void resetPassword(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController emailController,
  ) async {
    if (formKey.currentState!.validate()) {
      //todo show loading
      CustomDialog.showLoading(context: context);
      try {
        //todo check email is signup or not
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text,
        );
        //todo hide loading
        CustomDialog.hideLoading(context: context);
        //todo show message successfully
        CustomDialog.showMessage(
          context: context,
          title: AppStrings.successfully,
          styleTitle: TextStyles.font22BrownDarkSemiBold,
          message: AppStrings.passwordResetSent,
          styleMessage: TextStyles.font18SecondMedium,
          posActionName: AppStrings.ok,
          stylePosActionName: TextStyles.font22BrownDarkSemiBold,
          posActionClick: () {
            Navigator.pushReplacementNamed(context, Routes.loginRouteName);
          },
        );
      } on FirebaseAuthException catch (e) {
        //todo hide loading
        CustomDialog.hideLoading(context: context);
        String message;
        if (e.code == 'user-not-found') {
          message = AppStrings.userNotFound;
        } else if (e.code == 'invalid-email') {
          message = AppStrings.invalidNotValid;
        } else {
          message = e.message ?? AppStrings.somethingWentWrong;
        }
        //todo show message error
        CustomDialog.showMessage(
          context: context,
          title: AppStrings.error,
          styleTitle: TextStyles.font22BrownDarkSemiBold,
          message: message,
          styleMessage: TextStyles.font18SecondMedium,
          posActionName: AppStrings.ok,
          stylePosActionName: TextStyles.font22BrownDarkSemiBold,
        );
      } catch (e) {
        //todo hide loading
        CustomDialog.hideLoading(context: context);
        //todo show message error
        CustomDialog.showMessage(
          context: context,
          title: AppStrings.error,
          styleTitle: TextStyles.font22BrownDarkSemiBold,
          message: e.toString(),
          styleMessage: TextStyles.font18SecondMedium,
          posActionName: AppStrings.ok,
          stylePosActionName: TextStyles.font22BrownDarkSemiBold,
        );
      }
    }
  }
}
