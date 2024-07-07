import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String id;
  bool isAdmin;
  String name;
  String lastName;
  String phone;
  String email;
  String address;
  String curp;
  DateTime lastActivity;

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
      'lastActivity': lastActivity.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      isAdmin: map['isAdmin'] as bool,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      curp: map['curp'] as String,
      lastActivity: DateTime.fromMillisecondsSinceEpoch(map['lastActivity'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
