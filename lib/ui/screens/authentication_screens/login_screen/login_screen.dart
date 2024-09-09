import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/config.dart';
import '../../../ui.dart';
import 'widgets/widgets.dart';

@RoutePage()
// ignore: must_be_immutable
class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Future<void> login(BuildContext context,WidgetRef ref) async {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      bool resp = await ref
          .read(authUseCasesProvider)
          .login(userController.text, passwordController.text);

      if (!context.mounted) return;

      if (resp) {
        if (HelperPrefs.isAdmin) {
          context.pushRoute(const AdminHomeRoute());
        } else {
          context.pushRoute(const ClientHomeRoute());
        }
      } else {
        print('No se pudo iniciar sesión');
      }
    }
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const ImageLogoWidget(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: size.height * 0.68,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Inicio de sesión',
                          style: theme.textTheme.headlineMedium!
                              .copyWith(letterSpacing: 1),
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomTextField(
                                  margin: EdgeInsets.zero,
                                  controller: userController,
                                  label: 'Correo electrónico',
                                  node: node1,
                                  onSubmitted: () => FocusScope.of(context)
                                      .requestFocus(node2),
                                  inputType: TextInputType.emailAddress),
                              CustomTextField(
                                margin: EdgeInsets.zero,
                                controller: passwordController,
                                label: 'Contraseña',
                                node: node2,
                                inputType: TextInputType.text,
                                typeTextField: TypeTextField.password,
                                onSubmitted: () => login(context, ref),
                              ),
                              CustomTextButton(
                                  onTap: () {},
                                  text: '¿Olvidaste tu contraseña?')
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: CustomElevatedButton(
                            labelStyle: theme.textTheme.labelLarge!.copyWith(
                                color: MainColorsApp.backgroundColor,
                                fontWeight: FontWeight.bold),
                            colorLabel: MainColorsApp.backgroundColor,
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.02),
                            label: 'Iniciar sesión',
                            onTap: () => login(context, ref),
                          )),
                      const Expanded(
                          flex: 1,
                          child: GoToRegisterWidget()),
                      const Expanded(
                          flex: 1,
                          child: SocialMediaWidget()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
  

  
}
