import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'commons.dart';

class CustomSelectPhotoAreaWidget extends StatelessWidget {
  final Widget child;
  final ImageSource? source;
  final bool multiSelection;
  final double borderRadius;
  final Function(ImageReturn? imageSelected)? onImageSelected;
  final Function(List<ImageReturn>? imagesSelected)? onMultiImageSelected;
  const CustomSelectPhotoAreaWidget(
      {super.key,
      required this.child,
      this.multiSelection = false,
      this.borderRadius = 10,
      this.source,
      this.onImageSelected,
      this.onMultiImageSelected});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: child,
        ),
        Material(
            color: Colors.transparent,
            child: InkWell(
              onLongPress: () async {
                FocusScope.of(context).unfocus();
                if (multiSelection) {
                  try {
                    onMultiImageSelected!(
                        await ImagePickerHelper.pickMultiImage(
                            source: source ?? ImageSource.gallery));
                  } catch (e) {
                    rethrow;
                  }
                } else {
                  try {
                    onImageSelected!(await ImagePickerHelper.pickImage(
                        source: source ?? ImageSource.gallery));
                  } catch (e) {
                    rethrow;
                  }
                }
              },
              borderRadius: BorderRadius.circular(borderRadius),
              onTap: () async {
                FocusScope.of(context).unfocus();
                if (multiSelection) {
                  try {
                    onMultiImageSelected!(
                        await ImagePickerHelper.pickMultiImage(
                            source: source ?? ImageSource.camera));
                  } catch (e) {
                    rethrow;
                  }
                } else {
                  try {
                    onImageSelected!(await ImagePickerHelper.pickImage(
                        source: source ?? ImageSource.camera));
                  } catch (e) {
                    rethrow;
                  }
                }
              },
            ))
      ],
    );
    // return Material(
    //   color: Colors.transparent,
    //   child: InkWell(
    //     onTap: () async {
    //       if (multiSelection) {
    //         try {
    //           onMultiImageSelected!(
    //               await ImagePickerHelper.pickMultiImage(source: source));
    //         } catch (e) {
    //           rethrow;
    //         }
    //       } else {
    //         try {
    //           onImageSelected!(
    //               await ImagePickerHelper.pickImage(source: source));
    //         } catch (e) {
    //           rethrow;
    //         }
    //       }
    //     },
    //     child: child,
    //   ),
    // );
  }
}
