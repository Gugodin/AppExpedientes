import '../../models.dart';
// Repositorio realacionado con el CRUD general de usuarios
abstract class UserRepositorie {
  Future<List<UserModel>> getAllUsers();
  Future<UserModel> getUserById(String idUser);
  Future<bool> createUser(UserModel userInfo);
  Future<bool> updateUser(UserModel userInfo, String idUser);
  Future<bool> deleteUser(String idUser);
  Future<bool> deactivateUser(String idUser);
  Future<bool> activateUser(String idUser);
}
