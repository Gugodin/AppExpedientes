import 'package:firebase_auth/firebase_auth.dart';

import '../../domain.dart';

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


