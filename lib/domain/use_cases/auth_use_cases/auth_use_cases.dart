// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expedientes/domain/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUseCases {

  AuthUseCases({
    required this.authRepositorie,
  });

  AuthRepositorie authRepositorie;

  Future<bool> login (String email,String password) => authRepositorie.login(email, password);
  Future<void> logOut () => authRepositorie.logOut();
  Future<bool> resetPassword (String email) => authRepositorie.resetPassword(email);
  Future<String?> requestRegister (RequestModel request) => authRepositorie.requestRegister(request);
  Stream<User?> observeUserAuthState (UserModel userToRegister) => authRepositorie.observeUserAuthState();

}


