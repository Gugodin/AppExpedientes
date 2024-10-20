// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../domain.dart';

// Casos de uso general del modulo de solicitudes
// En realidad esto es un adapter ya que esta tomando como parametro de la instacia a cualquier repositorio que venga

class RequestUseCases {
  final RequestRepositorie requestRepositorie;

  RequestUseCases({
    required this.requestRepositorie,
  });
  
  Future<String?> requestRegister (RequestModel request) => requestRepositorie.requestRegister(request);
  Future<bool?> hasRegistrationAcepted  (String idRequest) => requestRepositorie.hasRegistrationAcepted(idRequest);
  Future<bool> deleteRequest (String idRequest) => requestRepositorie.deleteRequest(idRequest);
}
