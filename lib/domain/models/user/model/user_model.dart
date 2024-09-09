import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String id;
  bool isAdmin;
  String name;
  String lastName;
  String phone;
  String email;
  String address;
  String? curp;
  DateTime? lastActivity;

  UserModel({
    required this.id,
    required this.isAdmin,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.address,
    required this.curp,
    required this.lastActivity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isAdmin': isAdmin,
      'name': name,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'address': address,
      'curp': curp,
      'lastActivity': lastActivity,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {


    return UserModel(
      id: id,
      isAdmin: map['admin'],
      name: map['name'] as String,
      lastName: map['last_name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      curp: map['curp'],
      lastActivity: map['last_activitie'] == null? null : (map['last_activitie'] as Timestamp).toDate() ,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source, String id) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>, id);

  @override
  String toString() {
    return 'UserModel(id: $id, isAdmin: $isAdmin, name: $name, lastName: $lastName, phone: $phone, email: $email, address: $address, curp: $curp, lastActivity: $lastActivity)';
  }
}
