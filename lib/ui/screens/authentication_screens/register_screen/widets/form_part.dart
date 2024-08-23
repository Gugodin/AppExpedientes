// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../commons/commons.dart';

class FormPart extends StatelessWidget {
  final ElementForm elementName;
  final ElementForm elementLastName;
  final ElementForm elementEmail;

  const FormPart(
      {super.key,
      required this.elementName,
      required this.elementLastName,
      required this.elementEmail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CustomTextField(
                        margin: EdgeInsets.zero,
                        controller: elementName.controller,
                        label: 'Nombre',
                        node: elementName.node,
                        isRequierd: true,
                        inputType: TextInputType.name)),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 1,
                    child: CustomTextField(
                        margin: EdgeInsets.zero,
                        controller: elementLastName.controller,
                        label: 'Apellido',
                        node: elementLastName.node,
                        isRequierd: true,
                        inputType: TextInputType.name)),
              ],
            )),
        Expanded(
            flex: 1,
            child: CustomTextField(
                margin: EdgeInsets.zero,
                controller: elementEmail.controller,
                label: 'Correo electrónico',
                node: elementEmail.node,
                isRequierd: true,
                inputType: TextInputType.emailAddress)),
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
