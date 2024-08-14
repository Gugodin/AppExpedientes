import 'package:auto_route/auto_route.dart';
import 'package:expedientes/config/assets/assets.dart';
import 'package:expedientes/config/colors/colors.dart';
import 'package:expedientes/ui/commons/commons.dart';
import 'package:flutter/cupertino.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                Container(
                  width: double.infinity,
                  height: size.height * 0.30,
                  alignment: Alignment.bottomCenter,
                  // padding: EdgeInsets.only(top: size.height * 0.04),
                  // decoration: const BoxDecoration(
                  //     color: Colors.grey,
                  //     boxShadow: [AppStyles.containerShadow],
                  //     borderRadius:
                  //         BorderRadius.vertical(bottom: Radius.circular(20))),

                  child: Container(
                    color: Colors.blue,
                    height: size.height * 0.23,
                    width: size.width * 0.50,
                    // child: Image.asset(
                    //   AssetsApp.logo1,
                    //   filterQuality: FilterQuality.high,
                    //   fit: BoxFit.scaleDown,
                    // ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: size.height * 0.70,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Center(
                              child: Text(
                            'Inicio de sesión',
                            style: theme.textTheme.headlineMedium!
                                .copyWith(letterSpacing: 1),
                          ))),
                      Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomTextField(
                                  margin: EdgeInsets.zero,
                                  controller: userController,
                                  label: 'Usuario',
                                  node: node1,
                                  onSubmitted: () => FocusScope.of(context)
                                      .requestFocus(node2),
                                  inputType: TextInputType.text),
                              CustomTextField(
                                margin: EdgeInsets.zero,
                                controller: passwordController,
                                label: 'Contraseña',
                                node: node2,
                                inputType: TextInputType.text,
                                typeTextField: TypeTextField.password,
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
                                color: MainColorsApp.backgroundColor1,
                                fontWeight: FontWeight.bold),
                            colorLabel: MainColorsApp.backgroundColor1,
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            label: 'Iniciar sesión',
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                print('Hola');
                              }
                            },
                          )),
                      Expanded(
                          flex: 1,
                          child: Center(
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(15),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: '¿No tienes cuenta? ',
                                        style: theme.textTheme.labelMedium!
                                            .copyWith(
                                          fontSize: 18,
                                        )),
                                    TextSpan(
                                        text: 'Registrate',
                                        style: theme.textTheme.labelMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: MainColorsApp
                                                    .brightColorText)),
                                  ]),
                                ),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  // color: Colors.amber,
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    AssetsApp.socialMediaWhatsApp,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  // color: Colors.amber,
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                    AssetsApp.socialMediaFacebook,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              ],
                            ),
                          )),
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
