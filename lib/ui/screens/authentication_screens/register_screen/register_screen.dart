import 'package:auto_route/auto_route.dart';
import 'package:expedientes/config/assets/assets.dart';
import 'package:expedientes/config/colors/colors.dart';
import 'package:expedientes/ui/commons/custom_elevated_button.dart';
import 'package:expedientes/ui/screens/authentication_screens/register_screen/widets/form_part.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  FocusNode node1 = FocusNode();
  TextEditingController controllerLastName = TextEditingController();
  FocusNode node2 = FocusNode();
  TextEditingController controllerEmail = TextEditingController();
  FocusNode node3 = FocusNode();
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
                  height: size.height * 0.22,
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: size.height * 0.15,
                    width: size.width * 0.35,
                    child: Image.asset(
                      AssetsApp.logoOwlLegalNoLetters,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: size.height * 0.78,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Solicitud de registro',
                              style: theme.textTheme.headlineMedium!
                                  .copyWith(letterSpacing: 1),
                            ),
                          ))),
                      Expanded(
                          flex: 7,
                          child: FormPart(
                              elementName: ElementForm(
                                  controller: controllerName, node: node1),
                              elementLastName: ElementForm(
                                  controller: controllerLastName, node: node2),
                              elementEmail: ElementForm(
                                  controller: controllerEmail, node: node3))),
                      Expanded(
                          flex: 4,
                          child: Container(
                            color: Colors.blueAccent,
                          )),
                      Expanded(
                          flex: 3,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text:
                                          'Al presionar crear cuenta aceptas los ',
                                      style:
                                          theme.textTheme.labelMedium!.copyWith(
                                        fontSize: 18,
                                      )),
                                  WidgetSpan(
                                      child: InkWell(
                                    onTap: () {
                                      print('Terminos');
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: Text('Términos y condiciones ',
                                        style: theme.textTheme.labelMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: MainColorsApp
                                                    .brightColorText)),
                                  )),
                                  TextSpan(
                                      text: 'y ',
                                      style:
                                          theme.textTheme.labelMedium!.copyWith(
                                        fontSize: 18,
                                      )),
                                  WidgetSpan(
                                      child: InkWell(
                                    onTap: () {
                                      print('Politica');
                                    },
                                    borderRadius: BorderRadius.circular(10),
                                    child: Text('Política de privacidad. ',
                                        style: theme.textTheme.labelMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: MainColorsApp
                                                    .brightColorText)),
                                  )),
                                ]),
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: CustomElevatedButton(
                            labelStyle: theme.textTheme.labelLarge!.copyWith(
                                color: MainColorsApp.backgroundColor1,
                                fontWeight: FontWeight.bold),
                            colorLabel: MainColorsApp.backgroundColor1,
                            margin: EdgeInsets.symmetric(
                              vertical: size.height * 0.01,
                            ),
                            label: 'Solicitar registro',
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                print('Hola');
                              }
                            },
                          )),
                      Expanded(
                          flex: 3,
                          child: Center(
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(15),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: '¿Ya tienes cuenta? ',
                                        style: theme.textTheme.labelMedium!
                                            .copyWith(
                                          fontSize: 18,
                                        )),
                                    TextSpan(
                                        text: 'Inicia sesión',
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
