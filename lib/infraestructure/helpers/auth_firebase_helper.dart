import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseHelper {
  static final instance = AuthFirebaseHelper._();

  AuthFirebaseHelper._();

  factory AuthFirebaseHelper() {
    return instance;
  }

  final FirebaseAuth autInstance = FirebaseAuth.instance;

  Stream<User?> get stateOfUser => autInstance.authStateChanges();

  Future<UserCredential?> loginEmailAndPassword(String email, String password) async {
    try {
      return await autInstance.signInWithEmailAndPassword(
        email: email, password: password);
    } catch (e) {
      return null;
    }
  }

  Future<bool> resetPasswordByEmail(String email) async {
    try {
      await autInstance.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
    
  }
}
