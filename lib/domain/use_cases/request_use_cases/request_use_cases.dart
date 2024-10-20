// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../domain.dart';

class RequestUseCases {
  final RequestRepositorie requestRepositorie;

  RequestUseCases({
    required this.requestRepositorie,
  });
  
  Future<String?> requestRegister (RequestModel request) => requestRepositorie.requestRegister(request);
  Future<bool?> hasRegistrationAcepted  (String idRequest) => requestRepositorie.hasRegistrationAcepted(idRequest);
  Future<bool> deleteRequest (String idRequest) => requestRepositorie.deleteRequest(idRequest);
}
