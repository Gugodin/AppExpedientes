import 'package:expedientes/config/config.dart';
import 'package:flutter/material.dart';

class MenuLastCaseWidget extends StatelessWidget {
  const MenuLastCaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.22,
      width: size.width * 0.35,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          boxShadow: const [AppStyles.buttonShadow],
          color: MainColorsApp.containerDarkColor,
          borderRadius: BorderRadius.circular(15)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MenuItem(nameButton: 'Planos digitales', asset: 'Icons.abc'),
          MenuItem(nameButton: 'Copias certificadas', asset: 'Icons.abc'),
          MenuItem(nameButton: 'Originales', asset: ' Icons.abc'),
          MenuItem(nameButton: 'Extras', asset: 'Icons.abc')
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String nameButton;
  final String asset;
  // TODO Add rote parameter
  const MenuItem({super.key, required this.nameButton, required this.asset});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: MainColorsApp.brightColorText),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: MainColorsApp.backgroundColorD),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            nameButton,
            style: theme.textTheme.labelSmall!.copyWith(
                color: Colors.black, fontSize: 8, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
