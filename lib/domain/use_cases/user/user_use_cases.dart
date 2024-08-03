// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expedientes/domain/models/models.dart';

class AuthUserUseCases {

  AuthUserUseCases({
    required this.authRepositorie,
    required this.userRepositorie,
  });

  AuthUserRepositorie authRepositorie;

  Future<UserModel?> login (String email,String password) => authRepositorie.login(email, password);
  Future<void> logOut () => authRepositorie.logOut();
  Future<bool> resetPassword (String email) => authRepositorie.resetPassword(email);
  Future<bool> registerUser (UserModel userToRegister) => authRepositorie.registerUser(userToRegister);
  
  UserRepositorie userRepositorie;

  Future<List<UserModel>> getAllUsers() => userRepositorie.getAllUsers();
  Future<UserModel> getUserById(String idUser) => userRepositorie.getUserById(idUser);
  Future<bool> createUser(UserModel userInfo) => userRepositorie.createUser(userInfo);
  Future<bool> updateUser(UserModel userInfo, String idUser) => userRepositorie.updateUser(userInfo, idUser);
  Future<bool> deleteUser(String idUser) => userRepositorie.deleteUser(idUser);
  Future<bool> deactivateUser(String idUser) => userRepositorie.deactivateUser(idUser);
  Future<bool> activateUser(String idUser) => userRepositorie.activateUser(idUser);

}
