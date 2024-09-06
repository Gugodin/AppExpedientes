import 'package:auto_route/auto_route.dart';
import 'package:expedientes/config/colors/colors.dart';
import 'package:expedientes/config/routes/AppRouter/AppRouter.gr.dart';
import 'package:flutter/material.dart';

class GoToRegisterWidget extends StatelessWidget {
  const GoToRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: InkWell(
        onTap: () {
          context.router.push(const RegisterRoute());
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '¿No tienes cuenta? ',
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 18,
                  )),
              TextSpan(
                  text: 'Registrate',
                  style: theme.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationColor: MainColorsApp.brightColorText)),
            ]),
          ),
        ),
      ),
    );
  }
}
