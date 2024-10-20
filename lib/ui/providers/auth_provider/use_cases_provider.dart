
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/domain.dart';
import '../../../infraestructure/infraestructure.dart';

part 'use_cases_provider.g.dart';


@riverpod
AuthUseCases authUseCases(AuthUseCasesRef ref) {
  return AuthUseCases(authRepositorie:AuthApi());
}

@riverpod
RequestUseCases requestUseCases(RequestUseCasesRef ref) {
  return RequestUseCases(requestRepositorie:RequestApi());
}