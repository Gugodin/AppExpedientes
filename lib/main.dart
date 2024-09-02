import 'package:expedientes/app/app.dart';
import 'package:expedientes/firebase_options.dart';
import 'package:expedientes/infraestructure/infraestructure.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await HelperPrefs.initPrefs();
  // Ideal time to initialize
  runApp(ExpedientApp());
}
