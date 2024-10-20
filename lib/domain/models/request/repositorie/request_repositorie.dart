import '../model/model.dart';
// Repositorio el cual tendrá las funcionalidades relacionadas a guardado de solicitudes (cuentas o casos)
abstract class RequestRepositorie {
  Future<String?> requestRegister(RequestModel userToRegister);
  Future<bool> deleteRequest(String idRegistration);
  Future<bool?> hasRegistrationAcepted(String idRegistration);
}
