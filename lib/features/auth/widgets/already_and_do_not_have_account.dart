import 'package:flutter/material.dart';

import '../../../core/theme/app_styles.dart';

class AlreadyAndDoNotHaveAccount extends StatelessWidget {
  const AlreadyAndDoNotHaveAccount({
    super.key,
    required this.text,
    required this.textButton,
    required this.onPressed,
  });

  final String text;
  final String textButton;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: TextStyles.font16SecondMedium),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: TextStyles.font16BrownDarkBoldItalicUnderline,
          ),
        ),
      ],
    );
  }
}
