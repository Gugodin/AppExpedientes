import 'package:expedientes/domain/models/models.dart';
import 'package:expedientes/ui/helpers/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../infraestructure.dart';

class AuthApi implements AuthRepositorie {
  final authHelper = AuthFirebaseHelper();
  final storeHelper = StoreFirebaseHelper();

  @override
  Future<bool> login(String email, String password) async {
    final userCredentials =
        await authHelper.loginEmailAndPassword(email, password);

    if (userCredentials == null) return false;

    final user =
        await storeHelper.userCollection.getUserById(userCredentials.user!.uid);

    print('User => $user');
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
  Future<bool> registerUser(UserModel userToRegister) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Stream<User?> observeUserAuthState() {
    // TODO: implement observeUserAuthState
    return authHelper.stateOfUser;
  }
}
