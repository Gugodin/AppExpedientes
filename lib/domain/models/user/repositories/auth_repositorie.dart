import 'package:firebase_auth/firebase_auth.dart';

// Repositorio encargado de realizar las tareas relacionadas con la autenticación del usuario
abstract class AuthRepositorie {
  Stream<User?> observeUserAuthState ();
  Future<bool> login (String email,String password);
  Future<void> logOut ();
  Future<bool> resetPassword (String email);
}
