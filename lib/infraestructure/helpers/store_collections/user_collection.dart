// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/domain.dart';

class UserCollection {
  FirebaseFirestore storeInstance;

  UserCollection({
    required this.storeInstance,
  });

  final String _collection = 'user';

  Future<UserModel?> getUserById(String idUser) async {
    try {
      final document =
          await storeInstance.collection(_collection).doc(idUser).get();

      return UserModel.fromMap(document.data()!, idUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
