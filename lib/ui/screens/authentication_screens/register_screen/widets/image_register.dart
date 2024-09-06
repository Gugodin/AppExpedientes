import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
class ImageRegisterWidget extends StatelessWidget {
  const ImageRegisterWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.18,
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: size.height * 0.11,
        width: size.width * 0.35,
        child: Image.asset(
          AssetsApp.logoOwlLegalNoLetters,
          filterQuality: FilterQuality.high,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}