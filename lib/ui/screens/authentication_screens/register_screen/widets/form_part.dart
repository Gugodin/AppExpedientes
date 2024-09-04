// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../commons/commons.dart';

class FormPart extends StatelessWidget {
  final ElementForm elementName;
  final ElementForm elementNumber;
  final ElementForm elementEmail;

  const FormPart(
      {super.key,
      required this.elementName,
      required this.elementNumber,
      required this.elementEmail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  labelStyle: theme.textTheme.labelMedium,
                  margin: EdgeInsets.zero,
                  controller: elementName.controller,
                  label: 'Nombre y apellido',
                  node: elementName.node,
                  isRequierd: true,
                  inputType: TextInputType.name),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: CustomTextField(
                  prefix: const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text(
                      '+52',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  labelStyle: theme.textTheme.labelMedium,
                  margin: EdgeInsets.zero,
                  controller: elementNumber.controller,
                  label: 'Número de telefono',
                  node: elementNumber.node,
                  formatters: [LengthLimitingTextInputFormatter(10)],
                  isRequierd: true,
                  inputType: TextInputType.phone),
            ),
          ],
        ),
        CustomTextField(
            labelStyle: theme.textTheme.labelMedium,
            margin: EdgeInsets.zero,
            controller: elementEmail.controller,
            label: 'Correo electrónico',
            node: elementEmail.node,
            isRequierd: true,
            inputType: TextInputType.emailAddress),
      ],
    );
  }
}

class ElementForm {
  TextEditingController controller;
  FocusNode node;
  ElementForm({
    required this.controller,
    required this.node,
  });
}
