// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  final IconData icon;
  final Color? colorIcon;
  final Color? colorBackGround;
  final Function() onTap;
  final bool isLoading;
  final EdgeInsets margin;

  const CustomCircleButton(
      {required this.icon,
      this.colorIcon,
      this.colorBackGround,
      required this.onTap,
      this.margin = const EdgeInsets.all(10),
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorBackGround ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Icon(
              icon,
              color: colorIcon ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
