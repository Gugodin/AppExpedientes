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
  TextEditingController userController = TextEditingController();
  FocusNode node1 = FocusNode();

  sendCode() async {
    if (_formKey.currentState!.validate()) {}
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
                child: Column(
                  children: [
                    ImageLogo(
                        containerSize:
                            Size(double.infinity, size.height * 0.32),
                        imageSize: Size(size.width * 0.50, size.height * 0.23),
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
                            'Escribe el correo electrónico con el que esta registrado, te mandaremos un código de verificación para que restablezcas tu contraseña.',
                            style: theme.textTheme.labelSmall,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                              margin: EdgeInsets.zero,
                              controller: userController,
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
                              labelStyle: theme.textTheme.labelLarge!.copyWith(
                                  color: MainColorsApp.backgroundColor,
                                  fontWeight: FontWeight.bold),
                              colorLabel: MainColorsApp.backgroundColor,
                              margin: EdgeInsets.symmetric(
                                  vertical: size.height * 0.02),
                              label: 'Enviar código',
                              // isLoading: isLoading,
                              onTap: () => sendCode(),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
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
