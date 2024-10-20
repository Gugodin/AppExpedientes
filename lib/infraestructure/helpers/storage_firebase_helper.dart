import 'package:firebase_storage/firebase_storage.dart';
import 'storage_reference/storage_reference.dart';


// STORAGE FOR DOCUMENTS

class StorageFirebaseHelper{
  static final instance = StorageFirebaseHelper._();

  StorageFirebaseHelper._();

  factory StorageFirebaseHelper(){
    return instance;
  }

  FirebaseStorage storageInstance = FirebaseStorage.instance;

  late RequestReference requestReference = RequestReference(storageInstance: storageInstance);
}