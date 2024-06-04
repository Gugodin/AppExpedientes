import 'package:auto_route/auto_route.dart';
import 'package:expedientes/ui/commons/commons.dart';
import 'package:flutter/material.dart';

import '../../../config/styles/styles.dart';

@RoutePage()
// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height * 0.35,
                padding: EdgeInsets.only(top: size.height * 0.04),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [AppStyles.containerShadow],
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20))),
              ),
              SizedBox(
                height: size.height * 0.65,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Center(
                            child: Text(
                          'Iniciar sesión',
                          style: theme.textTheme.headlineMedium,
                        ))),
                    Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            CustomTextField(
                                controller: userController,
                                label: 'Usuario',
                                prefixIcon: Icons.person,
                                node: node1,
                                onSubmitted: () =>
                                    FocusScope.of(context).requestFocus(node2),
                                inputType: TextInputType.text),
                            CustomTextField(
                              controller: passwordController,
                              label: 'Contraseña',
                              prefixIcon: Icons.lock,
                              node: node2,
                              inputType: TextInputType.text,
                              typeTextField: TypeTextField.password,
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          color: Colors.green,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
