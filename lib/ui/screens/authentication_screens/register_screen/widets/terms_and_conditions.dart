import 'package:expedientes/config/colors/colors.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: 'Al presionar crear cuenta aceptas los',
                style: theme.textTheme.labelMedium!.copyWith(
                  fontSize: 15,
                )),
            WidgetSpan(
                child: InkWell(
              onTap: () {
                print('Terminos');
              },
              borderRadius: BorderRadius.circular(10),
              child: Text(' Términos y condiciones ',
                  style: theme.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationColor: MainColorsApp.brightColorText)),
            )),
            TextSpan(
                text: 'y',
                style: theme.textTheme.labelMedium!.copyWith(
                  fontSize: 15,
                )),
            WidgetSpan(
                child: InkWell(
              onTap: () {
                print('Politica');
              },
              borderRadius: BorderRadius.circular(10),
              child: Text(' Política de privacidad. ',
                  style: theme.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationColor: MainColorsApp.brightColorText)),
            )),
          ]),
        ),
      ),
    );
  }
}
