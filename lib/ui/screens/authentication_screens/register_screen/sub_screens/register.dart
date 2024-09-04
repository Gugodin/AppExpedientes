import 'dart:io';
import 'package:expedientes/ui/commons/custom_select_photo_area.dart';
import 'package:expedientes/ui/screens/authentication_screens/register_screen/widets/go_to_login.dart';
import 'package:flutter/material.dart';

import '../widets/widgets.dart';

class RegisterBody extends StatefulWidget {
  final Function(String idRegister) onRegistrated;
  const RegisterBody({super.key, required this.onRegistrated});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  FocusNode node1 = FocusNode();
  TextEditingController controllerName = TextEditingController();
  FocusNode node2 = FocusNode();
  TextEditingController controllerNumber = TextEditingController();
  FocusNode node3 = FocusNode();
  TextEditingController controllerEmail = TextEditingController();
  File? imageSelected;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Solicitud de registro',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(letterSpacing: 1),
                ),
              ))),
          Expanded(
              flex: 8,
              child: FormPart(
                  elementName:
                      ElementForm(controller: controllerName, node: node1),
                  elementNumber:
                      ElementForm(controller: controllerNumber, node: node2),
                  elementEmail:
                      ElementForm(controller: controllerEmail, node: node3))),
          Expanded(
              flex: 5,
              child: CustomSelectPhotoAreaWidget(
                onImageSelected: (image) {
                  if (image != null) {
                    setState(() {
                      imageSelected = image.imageInFile;
                    });
                  }
                },
                child: CardCredential(
                  imageSelected: imageSelected,
                ),
              )),
          const Expanded(flex: 3, child: TermsAndConditionWidget()),
          Expanded(
              flex: 2,
              child: ButtonRegister(
                formKey: _formKey,
                imageSelected: imageSelected,
                onRegistered: widget.onRegistrated,
              )),
          const Expanded(flex: 3, child: GoToLoginWidget()),
        ],
      ),
    );
  }
}
