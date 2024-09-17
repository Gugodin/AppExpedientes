// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import 'sub_screens/sub_screens.dart';
import '../../../ui.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String registrationRequest = '';

  @override
  void initState() {
    super.initState();
    _loadRegistrationRequest();
  }

  void _loadRegistrationRequest() async {
    // Obtén el valor de SharedPreferences

    setState(() {
      registrationRequest = HelperPrefs.registrationRequest;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              ImageLogo(
                  containerSize: Size(double.infinity, size.height * 0.18),
                  imageSize: Size(size.width * 0.35, size.height * 0.11),
                  imagePath: AssetsApp.logoOwlLegalNoLetters,
                  fit: BoxFit.scaleDown),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: size.height * 0.82,
                child: registrationRequest.isNotEmpty
                    ? HasRegisteredScreen(
                        onDeleteRegistration: () => setState(() {
                          registrationRequest = '';
                        }),
                      )
                    : RegisterBody(
                        onRegistrated: (idRegister) => setState(() {
                          registrationRequest = idRegister;
                        }),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
