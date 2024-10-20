
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
// Clase para hacer referencia dentro de nuestro storage a la carpeta de solicitudes
class RequestReference {
  FirebaseStorage storageInstance;

  RequestReference({
    required this.storageInstance,
  });

  final String _reference = 'request';

  /* 
    Funcionalidad que nos sirve para mandar un archivo a nuestro storage pero OJO
    le estamos pasando un idReference el cual sive para ponerle un identificador especifico al archivo
    en el caso de solicitudes de creación de cuenta, se le pone el id de la solicitud para cuando esta sea aceptada o eliminada
    podamos realizar la eliminación del archivo por medio del idReference
  */
  Future<bool> saveImageRequest(String idReference, File imageToUpload) async {
    try {
     await storageInstance.ref(_reference).child(idReference).putFile(imageToUpload);

      return true;
    } catch (e) {
      return false;
    }
  }
  /* 
    En este caso solamente entramos a la referencia y buscamos el idReferenece que nos propociona y se elimina el archivo que tenemos
    almacenado en esa referencia
  */

  Future<bool> deleteImageRequestById(String idReference) async {
    try {
      await storageInstance.ref(_reference).child(idReference).delete();
      return true;
    } catch (e) {
      return false;
    }
  }
}