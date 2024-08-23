// ignore_for_file: non_constant_identifier_names

import 'package:expedientes/config/assets/assets.dart';

String CURP_PATTERN =
    r"^([A-Z][AEIOUX][A-Z]{2}\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])[HM](?:AS|B[CS]|C[CLMSH]|D[FG]|G[TR]|HG|JC|M[CNS]|N[ETL]|OC|PL|Q[TR]|S[PLR]|T[CSL]|VZ|YN|ZS)[B-DF-HJ-NP-TV-Z]{3}[A-Z\d])(\d)$";
String EMAIL_PATTERN =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

final listImages = [
  AssetsApp.onB1,
  AssetsApp.onB2,
  AssetsApp.onB3,
  AssetsApp.onB4
];
final listTitle = [
  'Archiva tus casos',
  'Monitorea tus casos',
  'Las mejores asesorías',
  'Se parte de nosotros'
];
final listDescription = [
  'Almacena tus casos en nuestra aplicación por mucho tiempo, contamos con la mayor seguridad que existe para salvaguardar tus datos.',
  'Te mostramos paso a paso en donde vas con tu caso para que no tengas ningún tipo de duda al darle seguimiento.',
  'Contamos con el mejor buffete de abogados aquí en México los cuales llevarán tus casos de la mejor forma posible.',
  'Ya sea como abogado o cliente puedes ser parte de nuestra comunidad, buscando la justicia para todos los individuos.'
];
