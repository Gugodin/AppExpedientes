// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../config/const/const.dart';

enum TypeTextField { password, curp, none }

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final FocusNode node;
  final TextInputType inputType;
  final bool isRequierd;
  final TypeTextField typeTextField;
  final EdgeInsets margin;
  final Function()? onSubmitted;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.node,
    required this.inputType,
    this.isRequierd = true,
    this.typeTextField = TypeTextField.none,
    this.margin = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    this.onSubmitted,
    this.prefixIcon,
    this.sufixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${widget.label} ${widget.isRequierd ? '*' : ''}'),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            decoration: InputDecoration(
                suffixIcon: widget.typeTextField == TypeTextField.password
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: Icon(obscureText
                            ? Icons.visibility
                            : Icons.visibility_off))
                    : null,
                prefixIcon:
                    widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
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
