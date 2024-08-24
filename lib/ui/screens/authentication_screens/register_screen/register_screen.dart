// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:expedientes/config/assets/assets.dart';
import 'package:expedientes/config/colors/colors.dart';
import 'package:expedientes/ui/commons/custom_elevated_button.dart';
import 'package:expedientes/ui/screens/authentication_screens/register_screen/widets/form_part.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../commons/commons.dart';
import 'widets/widgets.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? imageSelected;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController controllerName = TextEditingController();
  FocusNode node1 = FocusNode();
  TextEditingController controllerLastName = TextEditingController();
  FocusNode node2 = FocusNode();
  TextEditingController controllerEmail = TextEditingController();
  FocusNode node3 = FocusNode();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ImageRegister(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: size.height * 0.82,
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
                          flex: 7,
                          child: FormPart(
                              elementName: ElementForm(
                                  controller: controllerName, node: node1),
                              elementLastName: ElementForm(
                                  controller: controllerLastName, node: node2),
                              elementEmail: ElementForm(
                                  controller: controllerEmail, node: node3))),
                      Expanded(
                          flex: 5,
                          child: CustomSelectPhotoAreaWidget(
                            // source: ImageSource.camera,
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
                          flex: 2, child: ButtonRegister(formKey: _formKey)),
                      Expanded(
                          flex: 3,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(15),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: '¿Ya tienes cuenta? ',
                                          style: theme.textTheme.labelMedium!
                                              .copyWith(
                                            fontSize: 18,
                                          )),
                                      TextSpan(
                                          text: 'Inicia sesión',
                                          style: theme.textTheme.labelMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor: MainColorsApp
                                                      .brightColorText)),
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
