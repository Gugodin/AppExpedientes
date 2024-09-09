

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expedientes/infraestructure/helpers/store_collections/user_collection.dart';

class StoreFirebaseHelper {
  static final instance = StoreFirebaseHelper._();

  StoreFirebaseHelper._();

  factory StoreFirebaseHelper() {
    return instance;
  }

  final FirebaseFirestore _storeInstance = FirebaseFirestore.instance;
  
  late UserCollection userCollection = UserCollection(storeInstance: _storeInstance);

}
