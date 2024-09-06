import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../config/config.dart';

class GoToLoginWidget extends StatelessWidget {
  const GoToLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: InkWell(
          onTap: () {
            context.router.push(LoginRoute());
          },
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '¿Ya tienes cuenta? ',
                    style: theme.textTheme.labelMedium!.copyWith(
                      fontSize: 18,
                    )),
                TextSpan(
                    text: 'Inicia sesión',
                    style: theme.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        decorationColor: MainColorsApp.brightColorText)),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
