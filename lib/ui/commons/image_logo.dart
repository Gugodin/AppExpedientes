// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageLogo extends StatelessWidget {
  final Size containerSize;
  final Size imageSize;
  final String imagePath;
  final BoxFit fit;
  
  const ImageLogo({
    super.key,
    required this.containerSize,
    required this.imageSize,
    required this.imagePath,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: containerSize.width,
                  height: containerSize.height,
                  alignment: Alignment.bottomCenter,
                  // color: Colors.amber,
                  child: SizedBox(
                    height: imageSize.height,
                    width: imageSize.width,
                    child: Image.asset(
                      imagePath,
                      filterQuality: FilterQuality.high,
                      fit: fit,
                    ),
                  ),
                );
  }
}
