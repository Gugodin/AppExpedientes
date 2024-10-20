import 'package:expedientes/app/app.dart';
import 'package:expedientes/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/helpers/prefs_helper.dart';
// Funcion Main de la aplicación
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Funcionalidad que sirve para realizar la configuración de nuestro proyecto de firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Inicializamos las preferencias del usuario
  await HelperPrefs.initPrefs();
  // Ideal time to initialize
  runApp(ProviderScope(child: ExpedientApp()));
}
