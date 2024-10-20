import '../model/model.dart';

abstract class RequestRepositorie {
  Future<String?> requestRegister(RequestModel userToRegister);
  Future<bool> deleteRequest(String idRegistration);
  Future<bool?> hasRegistrationAcepted(String idRegistration);
}
