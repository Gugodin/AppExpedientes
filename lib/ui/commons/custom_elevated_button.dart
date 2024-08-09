import 'package:expedientes/config/styles/styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final EdgeInsets margin;
  final String label;
  final Function() onTap;
  final bool isLoading;
  final Color? colorLabel;

  const CustomElevatedButton(
      {super.key,
      this.margin = const EdgeInsets.all(10),
      this.colorLabel,
      required this.label,
      required this.onTap,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: margin,
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          boxShadow: const [AppStyles.buttonShadow],
          borderRadius: BorderRadius.circular(20)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    label,
                    style: theme.textTheme.labelLarge!
                        .copyWith(color:colorLabel?? Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
