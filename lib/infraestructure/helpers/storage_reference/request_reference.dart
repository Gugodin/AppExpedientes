
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class RequestReference {
  FirebaseStorage storageInstance;

  RequestReference({
    required this.storageInstance,
  });

  final String _reference = 'request';

  Future<bool> saveImageRequest(String idReference, File imageToUpload) async {
    try {
      final document = await storageInstance.ref(_reference).child(idReference).putFile(imageToUpload);

      return true;
    } catch (e) {
      print('Subiendo imagen \n${e.toString()}');
      return false;
    }
  }
}