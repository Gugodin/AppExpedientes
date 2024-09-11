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
      print('REQUEST A CREAR');
      print(requestToCreate.toMap());
      final document = await storeInstance
          .collection(_collection)
          .add(requestToCreate.toMap());

      return document.id;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
