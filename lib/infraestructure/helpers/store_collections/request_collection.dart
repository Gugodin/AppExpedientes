// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/domain.dart';

class RequestCollection {
  FirebaseFirestore storeInstance;

  RequestCollection({
    required this.storeInstance,
  });

  final String _collection = 'request';

  Future<String?> createRequest(RequestModel requestToCreate) async {
    try {
      final document = await storeInstance
          .collection(_collection)
          .add(requestToCreate.toMap());

      return document.id;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool?> isRequestAceptedById(String idRequest) async {
    try {
      
      final document =
          await storeInstance.collection(_collection).doc(idRequest).get();

      final request = RequestModel.fromMap(document.data()!);
      if(request.isAcepted == null) return null;
      if (request.isAcepted!) return true;
      return false;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> delteRequestById(String idRequest) async {
    try {
      
      
    await storeInstance.collection(_collection).  doc(idRequest).delete();

      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
