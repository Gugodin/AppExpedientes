// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ImageReturn {
  Uint8List bytesImage;
  File imageInFile;

  ImageReturn({
    required this.bytesImage,
    required this.imageInFile,
  });

  @override
  String toString() => 'ImageReturn(imageInFile: $imageInFile ,bytesImage: $bytesImage )';
}

class ImagePickerHelper {
  // static Future<ImageReturn?> _requestPermissionAndProceed(ImageSource imageSource) async {
  //   final permitted = await PhotoManager
  // }

  static Future<ImageReturn?> pickImage({required ImageSource source}) async {
    return _selectImage(source: source);
  }

  static Future<ImageReturn?> _selectImage(
      {required ImageSource source}) async {
    final imagePicker = ImagePicker();

    final pickedImage =
        await imagePicker.pickImage(source: source, requestFullMetadata: false);

    if (pickedImage != null) {
      return ImageReturn(
          bytesImage: await pickedImage.readAsBytes(),
          imageInFile: File(pickedImage.path));
    }
    return null;
  }

  static Future<List<ImageReturn>?> pickMultiImage(
      {required ImageSource source}) async {
    return _selectMultiImage(source: source);
  }

  static Future<List<ImageReturn>?> _selectMultiImage(
      {required ImageSource source}) async {
    final imagePicker = ImagePicker();

    final pickedImage = await imagePicker.pickMultiImage(
      requestFullMetadata: false,
    );

    if (pickedImage.isNotEmpty) {
      List<ImageReturn> ltr = [];
      for (var element in pickedImage) {
        ltr.add(ImageReturn(
            bytesImage: await element.readAsBytes(),
            imageInFile: File(element.path)));
      }
      return ltr;
    }
    return null;
  }
}
