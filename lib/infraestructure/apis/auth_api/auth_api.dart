import 'package:expedientes/ui/helpers/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/domain.dart';
import '../../infraestructure.dart';
/* API que se encarga de implementar los eventos del AuthRepositorie y hace uso de los helpers para poder  
  implementar las funcionalidades requeridas
*/
class AuthApi implements AuthRepositorie {
  // Helper encargado de autenticacion de usuario
  final authHelper = AuthFirebaseHelper();
  // Helper encargado de la base de datos de firebase
  final storeHelper = StoreFirebaseHelper();
  // Helper encargado de guardados de archivos de firebase
  final storageHelper = StorageFirebaseHelper();


  @override
  // Funcionalidad para poder realizar un inicio de sesión de un usuario a nuestra app
  Future<bool> login(String email, String password) async {
    // Primero utilizamos el auth helper para realizar un login con email y contraseña
    final userCredentials =
        await authHelper.loginEmailAndPassword(email, password);
    // Si nos regresa null es porque no se pudo realizar el logeo de usuario
    if (userCredentials == null) return false;
    final user =
        await storeHelper.userCollection.getUserById(userCredentials.user!.uid);
    // Despues nos encargamos de obtener toda la data guardada dentro de firestore 
    try {
      // Si logramos obtener la data del usuario, la guardamos en las preferencias del usuario
      HelperPrefs.setUser(user!);
      return true;
    } catch (e) {
      // Si no lo logramos, regresamos un false para notificar al front
      return false;
    }
  }

  @override
   // Funcionalidad para poder realizar un cerrado de sesión de un usuario a nuestra app
  Future<void> logOut() async {
    // Simplemente hacemos llamado de el auth helper, tomamos la instancia de firebase y hagemos un signOut
    // No necesitamos hacer nada mas debido a que en el home screen tenemos un listener del estado de la sesión del usuario
    // Este se encargará de mandar al loguin
    await authHelper.autInstance.signOut();
  }
  
  @override
  // Funcionalidad para poder observar el estado de la sesión del usuario, este debe de ser inicializado en el home screen
  Stream<User?> observeUserAuthState() {
    return authHelper.stateOfUser;
  }

  @override
  // Funcionalidad para poder resetear la contraseña de un usuario
  Future<bool> resetPassword(String email) {
    return authHelper.resetPasswordByEmail(email);
  }
}
