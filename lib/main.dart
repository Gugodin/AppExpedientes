import 'package:expedientes/app/app.dart';
import 'package:expedientes/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/helpers/prefs_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await HelperPrefs.initPrefs();
  // Ideal time to initialize
  runApp(ProviderScope(child: ExpedientApp()));
}
