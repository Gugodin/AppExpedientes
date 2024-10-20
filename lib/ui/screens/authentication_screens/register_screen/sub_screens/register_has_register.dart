import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';
import '../../../../ui.dart';
import '../widets/widgets.dart';

class HasRegisteredScreen extends ConsumerStatefulWidget {
  final Function() onDeleteRegistration;
  const HasRegisteredScreen({super.key, required this.onDeleteRegistration});

  @override
  ConsumerState<HasRegisteredScreen> createState() =>
      _HasRegisteredScreenState();
}

class _HasRegisteredScreenState extends ConsumerState<HasRegisteredScreen> {
  int registrationAccepted = 0;

  @override
  void initState() {
    super.initState();
    // HelperPrefs.registrationRequest;
    verifyIfRegistrationIsAcepted();
  }

  void verifyIfRegistrationIsAcepted() async {
    final hasAcepted = await ref
        .read(authUseCasesProvider)
        .hasRegistrationAcepted(HelperPrefs.registrationRequest);

    switch (hasAcepted) {
      case true:
        setState(() {
          registrationAccepted = 1;
        });
        break;
      case false:
        setState(() {
          registrationAccepted = -1;
        });
        break;
      default:
        setState(() {
          registrationAccepted = 0;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: registrationAccepted == 1
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.end,
                    children: [
                      Text(
                        registrationAccepted == 1
                            ? label1HasRegisteredUserAcepted
                            : registrationAccepted == 0
                                ? label1HasRegisteredUser
                                : label1HasRegisteredUserNotAcepted,
                        style: theme.textTheme.labelMedium!
                            .copyWith(fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        registrationAccepted == 1
                            ? label2HasRegisteredUserAcepted
                            : registrationAccepted == 0
                                ? label2HasRegisteredUser
                                : label2HasRegisteredUserNotAcepted,
                        style: theme.textTheme.labelMedium!,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              registrationAccepted == 1
                  ? const SizedBox()
                  : Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: CustomCircleButton(
                          icon: Icons.close,
                          onTap: () async {
                            final didDelete = await ref
                                .read(authUseCasesProvider)
                                .deleteRequest(HelperPrefs.registrationRequest);
                            if (didDelete) {
                              HelperPrefs.registrationRequest = '';
                              widget.onDeleteRegistration();
                              HelperNotificationUI.notificationSuccess(
                                  'Solicitud eliminada');
                            } else {
                              HelperNotificationUI.notificationError(
                                  'Su solicitud no se pudo eliminar, intentelo en otro momento por favor');
                            }
                          },
                        ),
                      )),
            ],
          ),
        ),
        const Expanded(flex: 1, child: GoToLoginWidget()),
      ],
    );
  }
}
