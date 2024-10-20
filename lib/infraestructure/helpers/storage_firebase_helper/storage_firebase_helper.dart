import 'package:firebase_storage/firebase_storage.dart';
import 'storage_reference/storage_reference.dart';


// Helper realizado con patron singleton que se encargará de proporcionar funcionalidades de guardado de archivos en firebase
class StorageFirebaseHelper{
  // Patron singleton ------------------------------------------
  static final instance = StorageFirebaseHelper._();

  StorageFirebaseHelper._();

  factory StorageFirebaseHelper(){
    return instance;
  }
  FirebaseStorage storageInstance = FirebaseStorage.instance;
  //------------------------------------------------------------

  /* 
    Ojo como el storage de firebase es manejado como el explorador de archivos
    se maneja por referencias entonces una referencia sería:

    JavierGutierrez/Imagen.png

    En este caso la referencia y carpeta sería JavierGutierrez
  */
  late RequestReference requestReference = RequestReference(storageInstance: storageInstance);
}