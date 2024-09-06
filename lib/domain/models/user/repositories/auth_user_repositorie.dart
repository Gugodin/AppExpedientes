import '../model/model.dart';

abstract class AuthRepositorie {
  Future<UserModel?> login (String email,String password);
  Future<void> logOut ();
  Future<bool> resetPassword (String email);
  Future<bool> registerUser (UserModel userToRegister);
}
