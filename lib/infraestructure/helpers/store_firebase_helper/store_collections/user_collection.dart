// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../domain/domain.dart';

// Coleccion de usuarios que se encarga de proporcionar funcionalidades generales de la base de datos (CRUD)
class UserCollection {
  FirebaseFirestore storeInstance;

  UserCollection({
    required this.storeInstance,
  });

  final String _collection = 'user';
  /* Funcionalidad que nos sirve para obtener a un usuario con el id proporcionado */
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
  /* Verificación si algun usuario previamente registrado tienen el email o numero dadp */
  Future<bool> verifyIfUserExistWithEmail(String email, String phone) async {
    try {
      final document = await storeInstance
          .collection(_collection)
          .where('email', isEqualTo: email)
          .count()
          .get();

      final document2 = await storeInstance
          .collection(_collection)
          .where('phone', isEqualTo: phone)
          .count()
          .get();

      if (document.count == null || document2.count == null) return true;

      if (document.count! > 0 || document2.count! > 0) return true;

      return false;
    } catch (e) {
      print(e.toString());
      return true;
    }
  }
}
