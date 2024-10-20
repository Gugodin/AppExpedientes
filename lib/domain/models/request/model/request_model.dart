import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

// Este modelo tiene como objetivo guardar solicitudes de creación de cuenta o solicitudes de creaciones de casos
enum TypeRequest {account, cases}

class RequestModel {
  String? id;
  String? idUser;
  String? reason;
  DateTime dateCreated;
  String clientName;
  bool? isAcepted;
  String? reasonAdmin;
  TypeRequest typeRequest;
  String? email;
  String? phoneNumber;
  File? image;
  
  RequestModel({
    required this.id,
    this.idUser,
    this.reason,
    required this.dateCreated,
    required this.clientName,
    required this.isAcepted,
    this.reasonAdmin,
    required this.typeRequest,
    this.email,
    this.phoneNumber,
    this.image
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'reason': reason,
      'dateCreated': Timestamp.fromDate(dateCreated),
      'clientName': clientName,
      'isAcepted': isAcepted,
      'reasonAdmin': reasonAdmin,
      'typeRequest': typeRequest == TypeRequest.account? 'account': 'cases',
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      id: map['id'],
      idUser: map['idUser'] != null ? map['idUser'] as String : null,
      reason: map['reason'] != null ? map['reason'] as String : null,
      dateCreated:(map['dateCreated'] as Timestamp).toDate(),
      clientName: map['clientName'] as String,
      isAcepted: map['isAcepted'],
      reasonAdmin: map['reasonAdmin'] != null ? map['reasonAdmin'] as String : null,
      typeRequest: map['typeRequest'] == 'account'? TypeRequest.account: TypeRequest.cases,
      email: map['email'] != null ? map['email'] as String : null,
      phoneNumber:  map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestModel.fromJson(String source) => RequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RequestModel(id: $id, idUser: $idUser, reason: $reason, dateCreated: $dateCreated, clientName: $clientName, isAcepted: $isAcepted, reasonAdmin: $reasonAdmin, typeRequest: $typeRequest, email: $email, phoneNumber: $phoneNumber, image: $image)';
  }
}
