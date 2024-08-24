import 'package:flutter/material.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../commons/commons.dart';

class ButtonRegister extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const ButtonRegister({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return CustomElevatedButton(
      labelStyle: theme.textTheme.labelLarge!.copyWith(
          color: MainColorsApp.backgroundColor, fontWeight: FontWeight.bold),
      colorLabel: MainColorsApp.backgroundColor,
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.01,
      ),
      label: 'Solicitar registro',
      onTap: () {
        FocusScope.of(context).unfocus();
        if (formKey.currentState!.validate()) {
          print('Hola');
        }
      },
    );
  }
}
