import 'package:expedientes/domain/models/models.dart';

import '../../../services/services.dart';

class AuthApi implements AuthRepositorie {
  final authService = AuthFirebaseService();

  @override
  Future<UserModel?> login(String email, String password) async {
    await authService.loginEmailAndPassword(email, password);
  }

  @override
  Future<void> logOut() async {
    await authService.autInstance.signOut();
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
}
