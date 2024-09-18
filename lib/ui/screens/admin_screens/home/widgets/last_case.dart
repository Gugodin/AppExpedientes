import 'package:flutter/material.dart';

import 'last_case/last_case.dart';

class LastCaseWidget extends StatelessWidget {
  const LastCaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned.fill(child: CardLastCaseWidget()),
          Positioned(
              right: 10, top: size.height * 0.06, child: const MenuLastCaseWidget())
        ],
      ),
    );
  }
}
