import 'package:auto_route/auto_route.dart';
import 'package:expedientes/config/config.dart';
import 'package:flutter/material.dart';

import '../../../ui.dart';

@RoutePage()
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PANEL ADMIN',
              style: theme.textTheme.labelLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Nombre: ${HelperPrefs.nameUser} ${HelperPrefs.lastNameUser}',
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomCircleButton(
              icon: Icons.logout,
              onTap: () async {
                await HelperPrefs.clearPrefs();
                context.router.replace(LoginRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
