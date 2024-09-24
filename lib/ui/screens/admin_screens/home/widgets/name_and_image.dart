import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
import '../../../../ui.dart';

class NameAndImageWidget extends StatelessWidget {
  const NameAndImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bienvenida ${HelperPrefs.nameUser}',
                    style: theme.textTheme.labelLarge,
                  ),
                  const MiniContainer()
                ],
              ),
            )),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.notifications)),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

class MiniContainer extends StatelessWidget {
  const MiniContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: MainColorsApp.secondaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: const Text(
        labelLookForYourCases,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: MainColorsApp.backgroundColor),
      ),
    );
  }
}
