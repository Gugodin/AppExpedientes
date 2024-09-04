import 'dart:io';

import 'package:expedientes/config/colors/colors.dart';
import 'package:flutter/material.dart';

class CardCredential extends StatelessWidget {
  final File? imageSelected;
  const CardCredential({super.key, required this.imageSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return imageSelected == null
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MainColorsApp.backgroundColorTextFields,
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          size: 35,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Para poder segir con la solicitud de registro requerimos de una foto de tu identifiación oficial.',
                          textAlign: TextAlign.justify,
                          style: theme.textTheme.labelSmall!
                              .copyWith(fontSize: 13),
                        ),
                        Text(
                          '(Da un tap para tomar la foto o manten presionado para sacar la foto de tu galeria)',
                          textAlign: TextAlign.end,
                          style: theme.textTheme.labelSmall!.copyWith(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MainColorsApp.backgroundColorTextFields,
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.file(
                          imageSelected!,
                          fit: BoxFit.cover,
                          height: 100,
                        ))),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Asegurate que la foto sea clara de lo contrario la solicitud será rechazada.',
                          textAlign: TextAlign.justify,
                          style: theme.textTheme.labelSmall!.copyWith(
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'La foto sera eliminada previo a su registro.',
                          style: theme.textTheme.labelSmall!.copyWith(
                              fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ],
            ),
          );
  }
}
