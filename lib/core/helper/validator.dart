import 'package:coffee_cookies/core/constants/app_strings.dart';

class ValidatorHelper {
  static String? validateName(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppStrings.requiredName;
    }
    if (text.length < 3) {
      return AppStrings.nameMinLength;
    }
    return null;
  }

  static String? validateEmail(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppStrings.requiredEmail;
    }
    final bool emailValid = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+',
    ).hasMatch(text);
    if (!emailValid) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? text) {
    if (text == null || text.trim().isEmpty) {
      return AppStrings.requiredPassword;
    }
    if (text.length < 6) {
      return AppStrings.passwordMinLength;
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? text,
    String? originalPassword,
  ) {
    if (text == null || text.trim().isEmpty) {
      return AppStrings.requiredConfirmPassword;
    }
    if (text != originalPassword) {
      return AppStrings.passwordNotMatch;
    }
    return null;
  }
}
