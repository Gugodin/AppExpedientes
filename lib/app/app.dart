import 'package:expedientes/config/routes/AppRouter/AppRouter.dart';
import 'package:flutter/material.dart';

import '../config/themes/themes.dart';

class ExpedientApp extends StatelessWidget {
  ExpedientApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto expedientes',
      theme: themeAppLight,
      // darkTheme: themeAppDark,
      routerConfig: _appRouter.config(),
    );
  }
}
