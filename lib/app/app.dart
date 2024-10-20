import 'package:bot_toast/bot_toast.dart';
import 'package:expedientes/config/routes/AppRouter/AppRouter.dart';
import 'package:flutter/material.dart';

import '../config/themes/themes.dart';

// Este es simplemente la primera intancia de la aplicación
class ExpedientApp extends StatelessWidget {
  ExpedientApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto expedientes',
      theme: themeAppLight,
      builder: BotToastInit(),
      routerConfig: _appRouter.config(),
    );
  }
}
