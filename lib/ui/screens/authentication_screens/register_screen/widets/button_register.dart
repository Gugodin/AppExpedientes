import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
import '../../../../ui.dart';

class ButtonRegisterWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final File? imageSelected;
  final Function(String idRegister) onRegistered;
  const ButtonRegisterWidget({
    super.key,
    required this.formKey,
    required this.imageSelected,
    required this.onRegistered,
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
        if (formKey.currentState!.validate() && imageSelected != null) {
          print('HACEMOS SET STATE');
          HelperPrefs.registrationRequest = '1';
          onRegistered('1');
        } else {
          print('SELECCIONA UNA IMAGEN');
        }
      },
    );
  }
}
