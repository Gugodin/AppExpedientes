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
final listTitleOnBoarding = [
  'Archiva tus casos',
  'Monitorea tus casos',
  'Las mejores asesorías',
  'Se parte de nosotros'
];
final listDescriptionOnBoarding = [
  'Almacena tus casos en nuestra aplicación por mucho tiempo, contamos con la mayor seguridad que existe para salvaguardar tus datos.',
  'Te mostramos paso a paso en donde vas con tu caso para que no tengas ningún tipo de duda al darle seguimiento.',
  'Contamos con el mejor buffete de abogados aquí en México los cuales llevarán tus casos de la mejor forma posible.',
  'Ya sea como abogado o cliente puedes ser parte de nuestra comunidad, buscando la justicia para todos los individuos.'
];

const String label1HasRegisteredUser =
    'Su solicitud ha sido enviada, tenemos una espera de al menos 3 días habiles para contestarle. \n\nNos contactaremos con usted una vez ya se haya sido aceptada su solicitud.';
const String label2HasRegisteredUser =
    '\nSi desea cancelar la solicitud para mandar otra, haga click en el boton de abajo.';

const String label1HasRegisteredUserAcepted =
    'Su solicitud ha sido aceptada, espere a que nos contactemos con usted via número de teléfono o correo para proporcionarle sus credenciales.';
const String label2HasRegisteredUserAcepted =
    '\n(La contraseña podrá ser modificada dentro de la aplicación)';

const String label1HasRegisteredUserNotAcepted =
    'Su solicitud no ha sido aceptada, esto puede ser por motivos de foto no nitida o escribió algún dato mal.';
const String label2HasRegisteredUserNotAcepted =
    '\nElimine esta solicitud con el botón de abajo e intente realizar otra vez la solicitud.';
