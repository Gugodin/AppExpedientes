import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthRepositorie {
  Stream<User?> observeUserAuthState ();
  Future<bool> login (String email,String password);
  Future<void> logOut ();
  Future<bool> resetPassword (String email);
}
