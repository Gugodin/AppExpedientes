// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../domain.dart';

// Casos de uso general del modulo de usuarios
// En realidad esto es un adapter ya que esta tomando como parametro de la instacia a cualquier repositorio que venga

class UserUseCases {
  
    UserRepositorie userRepositorie;
    
  UserUseCases({
    required this.userRepositorie,
  });

  Future<List<UserModel>> getAllUsers() => userRepositorie.getAllUsers();
  Future<UserModel> getUserById(String idUser) => userRepositorie.getUserById(idUser);
  Future<bool> createUser(UserModel userInfo) => userRepositorie.createUser(userInfo);
  Future<bool> updateUser(UserModel userInfo, String idUser) => userRepositorie.updateUser(userInfo, idUser);
  Future<bool> deleteUser(String idUser) => userRepositorie.deleteUser(idUser);
  Future<bool> deactivateUser(String idUser) => userRepositorie.deactivateUser(idUser);
  Future<bool> activateUser(String idUser) => userRepositorie.activateUser(idUser);
}
