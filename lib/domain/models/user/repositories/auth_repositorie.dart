import 'package:firebase_auth/firebase_auth.dart';

import '../model/model.dart';

abstract class AuthRepositorie {
  Future<UserModel?> login (String email,String password);
  Future<void> logOut ();
  Future<bool> resetPassword (String email);
  Future<bool> registerUser (UserModel userToRegister);
  Stream<User?> observeUserAuthState ();
}
