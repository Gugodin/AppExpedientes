import 'package:expedientes/config/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final EdgeInsets margin;
  final String label;
  final Function() onTap;
  final bool isLoading;
  const CustomElevatedButton(
      {super.key,
      this.margin = const EdgeInsets.all(10),
      required this.label,
      required this.onTap,
      this.isLoading = false});

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: widget.margin,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          boxShadow: const [AppStyles.buttonShadow],
          borderRadius: BorderRadius.circular(20)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: widget.isLoading
                ? const CircularProgressIndicator()
                : Text(
                    widget.label,
                    style: theme.textTheme.labelLarge!
                        .copyWith(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
