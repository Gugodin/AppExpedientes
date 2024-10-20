import 'package:firebase_auth/firebase_auth.dart';

// Helper realizado con patron singleton que se encargará de proporcionar funcionalidades de autenticación
class AuthFirebaseHelper {
  // Patron singleton ------------------------------------------
  static final instance = AuthFirebaseHelper._();

  AuthFirebaseHelper._();

  factory AuthFirebaseHelper() {
    return instance;
  }

  final FirebaseAuth autInstance = FirebaseAuth.instance;
  //------------------------------------------------------------

  /* Funcionalidad de suma importancia que propociona un stream de estados del usuario actual 
    nos servirá para poder sacar al usuario al apartado de login al momento que cierre sesión o su
    token expire.

    Nos regresará como User = null al momento de que el usuario no tenga una sesión abierta
  */
  Stream<User?> get stateOfUser => autInstance.authStateChanges();

  /* Funcionalidad que nos sirve para iniciar sesión con el email y password que el usuario nos proporcione
    si no se logró iniciar sesión la funcionalidad tira un exception por eso lo tenemos dentro de un try y catch
  */
  Future<UserCredential?> loginEmailAndPassword(String email, String password) async {
    try {
      return await autInstance.signInWithEmailAndPassword(
        email: email, password: password);
    } catch (e) {
      return null;
    }
  }
  /* Funcionalidad que manda un correo electronico al usuario para poder realizar el reinicio de contraseña
    por si el usuario se olvido de la misma
  */
  Future<bool> resetPasswordByEmail(String email) async {
    try {
      await autInstance.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }
}
