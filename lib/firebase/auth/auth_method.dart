import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_cookies/provider/category_provider/category_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_strings.dart';
import '../../core/helper/custom_dialog.dart';
import '../../core/helper/shared_check_helper.dart';
import '../../core/routing/routes.dart';
import '../../core/theme/app_styles.dart';
import '../../provider/user_provider/user_provider.dart';
import '../firestore/firebase_utils.dart';
import '../firestore/model/user_model.dart';

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
          var userFire = await FireBaseUtils().getUserFromFirebase(
            user.uid,
          );
          var userProvider = Provider.of<UserProvider>(context, listen: false);
          userProvider.changeCurrentUser(userFire!);
          var categoryProvider = Provider.of<CategoryProvider>(
              context, listen: false);
          categoryProvider.changeIndex(0, userProvider.currentUser!.id);
          await SharedCheckHelper.setLogin(true);
          await FireBaseUtils.addStaticCategoriesIfEmpty(user.uid);
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
      TextEditingController nameController,
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
        var user = credential.user;
        await user!.sendEmailVerification();

        var userModel = UserModel(
          id: user.uid,
          name: nameController.text,
          email: emailController.text,
        );
        await FireBaseUtils().addUserToFirebase(userModel);
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.changeCurrentUser(userModel);
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
        var users = await FirebaseFirestore.instance
            .collection(UserModel.collectionName)
            .where('email', isEqualTo: emailController.text)
            .get();
        if (users.docs.isEmpty) {
          //todo hide loading
          CustomDialog.hideLoading(context: context);
          //todo show message email not registered
          CustomDialog.showMessage(
            context: context,
            title: AppStrings.error,
            styleTitle: TextStyles.font22BrownDarkSemiBold,
            message: AppStrings.emailNotRegistered,
            styleMessage: TextStyles.font18SecondMedium,
            posActionName: AppStrings.ok,
            stylePosActionName: TextStyles.font22BrownDarkSemiBold,
          );
          return;
        }
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
