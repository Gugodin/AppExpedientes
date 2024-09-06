import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
import '../../../../ui.dart';
import '../widets/widgets.dart';


class HasRegisteredScreen extends StatefulWidget {
  final Function() onDeleteRegistration;
  const HasRegisteredScreen({super.key, required this.onDeleteRegistration});

  @override
  State<HasRegisteredScreen> createState() => _HasRegisteredScreenState();
}

class _HasRegisteredScreenState extends State<HasRegisteredScreen> {
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        label1HasRegisteredUser,
                        style: theme.textTheme.labelMedium!
                            .copyWith(fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        label2HasRegisteredUser,
                        style: theme.textTheme.labelMedium!,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CustomCircleButton(
                      icon: Icons.close,
                      onTap: () async {
                        await HelperPrefs.clearPrefs();
                        widget.onDeleteRegistration();
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
