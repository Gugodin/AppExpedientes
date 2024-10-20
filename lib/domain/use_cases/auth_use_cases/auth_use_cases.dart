import 'package:firebase_auth/firebase_auth.dart';

import '../../domain.dart';

// Casos de uso general del modulo de autenticación
// En realidad esto es un adapter ya que esta tomando como parametro de la instacia a cualquier repositorio que venga

class AuthUseCases {

  AuthUseCases({
    required this.authRepositorie,
  });

  final AuthRepositorie authRepositorie;
  
  Future<bool> login (String email,String password) => authRepositorie.login(email, password);
  Future<void> logOut () => authRepositorie.logOut();
  Future<bool> resetPassword (String email) => authRepositorie.resetPassword(email);
  Stream<User?> observeUserAuthState () => authRepositorie.observeUserAuthState();

}


