import 'package:expedientes/domain/models/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService {

  static final instance = AuthFirebaseService._();

  AuthFirebaseService._();

  factory AuthFirebaseService() {
    return instance;
  }
  
   final FirebaseAuth autInstance = FirebaseAuth.instance;

   Stream<User?> get stateOfUser => autInstance.authStateChanges();

  Future<void> loginEmailAndPassword(String email, String password) async {
    final resp = await autInstance.signInWithEmailAndPassword(email: email, password: password);
  }

   Future<void> registerUser(UserModel user, String password) async {
    final resp = await autInstance.createUserWithEmailAndPassword(
        email: user.email, password: password);
  }
}
