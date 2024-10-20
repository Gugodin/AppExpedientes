import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/config.dart';
import '../../../ui.dart';
import 'widgets/widgets.dart';

@RoutePage()
class AdminHomeScreen extends ConsumerStatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  ConsumerState<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends ConsumerState<AdminHomeScreen> {
  late StreamSubscription<User?> subscription;
  @override
  void initState() {
    super.initState();
    subscription = ref.read(authUseCasesProvider).observeUserAuthState().listen(
      (event) {
        if (event == null) {
          context.router.replace(const LoginRoute());
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(flex: 3, child: TopBar()),
          const Expanded(flex: 6, child: LastCaseWidget()),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.yellow,
              )),
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.blue,
              )),
          Expanded(
              flex: 5,
              child: Container(
                color: Colors.purple,
              )),
          // Text(
          //   'PANEL ADMIN',
          //   style: theme.textTheme.labelLarge,
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Text(
          //   'Nombre: ${HelperPrefs.nameUser} ${HelperPrefs.lastNameUser}',
          //   style: const TextStyle(color: Colors.white),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // CustomCircleButton(
          //   icon: Icons.logout,
          //   onTap: () async {
          //     await ref.read(authUseCasesProvider).logOut();
          //     await HelperPrefs.clearPrefs();
          //   },
          // ),
        ],
      ),
    );
  }
}
