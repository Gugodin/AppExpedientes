import 'package:flutter/material.dart';

import '../../../../../config/config.dart';

class ImageLogoWidget extends StatelessWidget {
  const ImageLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
                  width: double.infinity,
                  height: size.height * 0.32,
                  alignment: Alignment.bottomCenter,
                  // color: Colors.amber,
                  child: SizedBox(
                    height: size.height * 0.23,
                    width: size.width * 0.50,
                    child: Image.asset(
                      AssetsApp.logoOwlLegalLetters,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                );
  }
}