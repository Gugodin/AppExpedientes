

import 'package:cloud_firestore/cloud_firestore.dart';

import 'store_collections/store_collections.dart';

class StoreFirebaseHelper {
  static final instance = StoreFirebaseHelper._();

  StoreFirebaseHelper._();

  factory StoreFirebaseHelper() {
    return instance;
  }

  final FirebaseFirestore _storeInstance = FirebaseFirestore.instance;
  
  late UserCollection userCollection = UserCollection(storeInstance: _storeInstance);
  late RequestCollection requestCollection = RequestCollection(storeInstance: _storeInstance);

}
