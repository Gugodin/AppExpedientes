import 'package:flutter/material.dart';

class ExpedientApp extends StatelessWidget {
  const ExpedientApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp.router(
      title: 'Proyecto expedientes',
      // theme: themeAppLight,
      // darkTheme: themeAppDark,
      // routerConfig: appRouter.config(),
    );
  }
}