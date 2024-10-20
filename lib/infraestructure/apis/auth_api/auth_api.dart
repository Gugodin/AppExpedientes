import 'package:expedientes/ui/helpers/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/domain.dart';
import '../../infraestructure.dart';

class AuthApi implements AuthRepositorie {
  final authHelper = AuthFirebaseHelper();
  final storeHelper = StoreFirebaseHelper();
  final storageHelper = StorageFirebaseHelper();

  @override
  Future<bool> login(String email, String password) async {
    final userCredentials =
        await authHelper.loginEmailAndPassword(email, password);
    if (userCredentials == null) return false;
    final user =
        await storeHelper.userCollection.getUserById(userCredentials.user!.uid);
    try {
      HelperPrefs.setUser(user!);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> logOut() async {
    await authHelper.autInstance.signOut();
  }
  
   @override
  Stream<User?> observeUserAuthState() {
    return authHelper.stateOfUser;
  }

   @override
  Future<bool> resetPassword(String email) {
    return authHelper.resetPasswordByEmail(email);
  }
}
