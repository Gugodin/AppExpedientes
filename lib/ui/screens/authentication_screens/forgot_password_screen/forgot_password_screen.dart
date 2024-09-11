import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/config.dart';
import '../../../ui.dart';

@RoutePage()
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  FocusNode node1 = FocusNode();

  bool isLoading = false;

  sendCode() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      final resp = await ref
          .read(authUseCasesProvider)
          .resetPassword(emailController.text);
      setState(() {
        isLoading = false;
      });
      if(!mounted) return;
      if (resp) {
        context.maybePop(); 
        HelperNotificationUI.notificationSuccess(
            'Se le ha enviado un correo de restablecimiento de contraseña, favor de verificarlo.');
      } else {
        HelperNotificationUI.notificationSuccess(
            'No se pudo enviar el correo, intentelo mas tarde.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ImageLogo(
                          containerSize:
                              Size(double.infinity, size.height * 0.32),
                          imageSize:
                              Size(size.width * 0.50, size.height * 0.23),
                          imagePath: AssetsApp.logoOwlLegalLetters,
                          fit: BoxFit.scaleDown),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        height: size.height * 0.68,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              'Escriba el correo electrónico con el que esta registrado, le mandaremos un código de verificación para que restablezca tu contraseña.',
                              style: theme.textTheme.labelSmall,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                margin: EdgeInsets.zero,
                                controller: emailController,
                                label: 'Correo electrónico',
                                node: node1,
                                onSubmitted: () => sendCode(),
                                inputType: TextInputType.emailAddress),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: size.height * 0.1,
                              width: double.infinity,
                              child: CustomElevatedButton(
                                labelStyle: theme.textTheme.labelLarge!
                                    .copyWith(
                                        color: MainColorsApp.backgroundColor,
                                        fontWeight: FontWeight.bold),
                                colorLabel: MainColorsApp.backgroundColor,
                                margin: EdgeInsets.symmetric(
                                    vertical: size.height * 0.02),
                                label: 'Enviar código',
                                isLoading: isLoading,
                                onTap: () => sendCode(),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: size.height * 0.05,
                  left: size.width * 0.04,
                  child: IconButton(
                      onPressed: () => context.maybePop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: MainColorsApp.brightColor,
                        size: 30,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
