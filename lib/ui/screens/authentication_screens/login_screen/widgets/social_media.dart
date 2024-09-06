import 'package:expedientes/config/assets/assets.dart';
import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(
              AssetsApp.socialMediaWhatsApp,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(
              AssetsApp.socialMediaFacebook,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
