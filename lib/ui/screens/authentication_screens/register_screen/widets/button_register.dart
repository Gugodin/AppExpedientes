// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:expedientes/domain/domain.dart';

import '../../../../../config/config.dart';
import '../../../../ui.dart';

class ButtonRegisterWidget extends ConsumerStatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;
  final File? imageSelected;
  final Function(String idRegister) onRegistered;
  const ButtonRegisterWidget({
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.formKey,
    required this.imageSelected,
    required this.onRegistered,
  });

  @override
  ConsumerState<ButtonRegisterWidget> createState() =>
      _ButtonRegisterWidgetState();
}

class _ButtonRegisterWidgetState extends ConsumerState<ButtonRegisterWidget> {
  bool isLoading = false;
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
      isLoading: isLoading,
      onTap: () async {
        FocusScope.of(context).unfocus();
        if (widget.formKey.currentState!.validate() &&
            widget.imageSelected != null) {
          setState(() {
            isLoading = true;
          });
          final idRequest = await ref
              .read(authUseCasesProvider)
              .requestRegister(RequestModel(
                  id: null,
                  dateCreated: DateTime.now(),
                  clientName: widget.nameController.text,
                  isAcepted: null,
                  typeRequest: TypeRequest.account,
                  email: widget.emailController.text,
                  image: widget.imageSelected,
                  phoneNumber: widget.phoneController.text));
          setState(() {
            isLoading = false;
          });

          if (idRequest == 'USER EXIST') {
            HelperNotificationUI.notificationError(
                'Ya existe un usuario con ese correo o número de teléfono, intente con otro.');
            return;
          }

          if (idRequest != null) {
            HelperPrefs.registrationRequest = idRequest;
            widget.onRegistered(idRequest);
          } else {
            HelperNotificationUI.notificationError(
                'No se pudo completar el registro, por favor intentelo mas tarde.');
          }
        } else {
          HelperNotificationUI.notificationError(
              'Selecciona una imagen por favor.');
        }
      },
    );
  }
}
