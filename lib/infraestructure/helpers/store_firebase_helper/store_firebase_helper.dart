import 'package:cloud_firestore/cloud_firestore.dart';

import 'store_collections/store_collections.dart';

// Helper realizado con patron singleton que se encargará de proporcionar funcionalidades de CRUD del la base de datos de firebase
class StoreFirebaseHelper {
  // Patron singleton ------------------------------------------
  static final instance = StoreFirebaseHelper._();

  StoreFirebaseHelper._();

  factory StoreFirebaseHelper() {
    return instance;
  }
  final FirebaseFirestore _storeInstance = FirebaseFirestore.instance;
  //------------------------------------------------------------

  /* 
    Ojo como el store de firebase trabaja por colecciones nos encargamos de separarar
    cada una de las colecciones en clases distintas para separar los CRUDS de cada una
    así mejoramos la escalabilidad y comprensibilidad del mismo helper
  */

  late UserCollection userCollection = UserCollection(storeInstance: _storeInstance);
  late RequestCollection requestCollection = RequestCollection(storeInstance: _storeInstance);
}
