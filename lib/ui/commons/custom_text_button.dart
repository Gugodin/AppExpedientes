import 'package:flutter/material.dart';

import '../../config/config.dart';


class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final TextStyle? textStyle;

  const CustomTextButton({super.key, required this.text, required this.onTap, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(text,
            style: textStyle ?? theme.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                decoration: TextDecoration.underline,
                decorationColor: MainColorsApp.brightColorText)),
      ),
    );
  }
}
