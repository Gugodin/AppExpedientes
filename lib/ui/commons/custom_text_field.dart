// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expedientes/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/const/const.dart';

enum TypeTextField { password, curp, none }

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextStyle? labelStyle;
  final FocusNode node;
  final TextInputType inputType;
  final bool isRequierd;
  final TypeTextField typeTextField;
  final EdgeInsets margin;
  final Function()? onSubmitted;
  final IconData? sufixIcon;
  final String? hintText;
  final List<TextInputFormatter>? formatters;
  final Widget? prefix;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.node,
      this.hintText,
      this.labelStyle,
      required this.inputType,
      this.isRequierd = true,
      this.typeTextField = TypeTextField.none,
      this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      this.onSubmitted,
      this.sufixIcon,
      this.prefix,
      this.formatters});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: widget.margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.label} ${widget.isRequierd ? '*' : ''}',
            style: widget.labelStyle ?? theme.textTheme.labelLarge,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            inputFormatters: widget.formatters,
            style: theme.textTheme.labelMedium!.copyWith(
                fontSize: widget.inputType == TextInputType.phone ? 18 : 20),
            decoration: InputDecoration(
              hintText: widget.hintText ?? 'Escriba aquí',
              hintStyle: widget.inputType == TextInputType.phone
                  ? TextStyle(
                      color: MainColorsApp.brightColorText.withOpacity(0.3),
                      fontSize: 18)
                  : null,
              suffixIcon: widget.typeTextField == TypeTextField.password
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: MainColorsApp.brightColorText.withOpacity(0.8),
                      ))
                  : null,
              prefixIcon: widget.prefix,
            ),
            onFieldSubmitted: (value) {
              if (widget.onSubmitted != null) {
                widget.onSubmitted!.call();
              }
            },
            obscureText: widget.typeTextField == TypeTextField.password
                ? obscureText
                : false,
            controller: widget.controller,
            focusNode: widget.node,
            keyboardType: widget.inputType,
            validator: (value) {
              if (widget.inputType == TextInputType.emailAddress) {
                RegExp regExp = RegExp(EMAIL_PATTERN);
                return regExp.hasMatch(value!)
                    ? null
                    : 'Inserte un correo valido';
              }

              if (widget.inputType == TextInputType.phone &&
                  value!.length < 10) {
                return 'Número invalido';
              }

              if (widget.typeTextField == TypeTextField.curp) {
                RegExp regExp = RegExp(CURP_PATTERN);
                return regExp.hasMatch(value!)
                    ? null
                    : 'Inserte una CURP valida';
              }

              if (widget.isRequierd && value!.isEmpty) {
                return 'Requerido';
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}
