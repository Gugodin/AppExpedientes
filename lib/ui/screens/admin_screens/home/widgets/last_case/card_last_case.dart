import 'package:expedientes/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/config.dart';

class CardLastCaseWidget extends ConsumerWidget {
  const CardLastCaseWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    Size size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: MainColorsApp.secondaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [AppStyles.buttonShadow],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Expanded(flex: 1, child: NameAndDate()),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(right: size.width * 0.35),
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Cristel Alejandra Paniagua',
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.labelMedium!.copyWith(
                              color: MainColorsApp.backgroundColorD,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                  const Expanded(flex: 3, child: Description()),
                  const Expanded(flex: 2, child: NotesWidget()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: MainColorsApp.containerDarkColor,
            borderRadius: BorderRadius.circular(10)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Notas',
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomCircleButton(
                    icon: Icons.add,
                    iconSize: 20,
                    colorIcon: Colors.black,
                    colorBackGround: MainColorsApp.brightColorText,
                    padding: const EdgeInsets.all(0),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descripción:',
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.labelSmall!.copyWith(
              color: MainColorsApp.backgroundColorD,
              fontWeight: FontWeight.bold),
        ),
        Expanded(
            child: Text(
                'asdklñsdf jklñsdf ahjklasdf jhklasdf jkhlasdf hjklfsda jkhsdfa hjkasdf hjklasdfhjklasdf hjksadf asdfhjklasdfhjklasdfjklhsdafasdfkjlhasdfhjkl ',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: theme.textTheme.labelSmall!.copyWith(
                    color: MainColorsApp.backgroundColorD,
                    fontWeight: FontWeight.w500)))
      ],
    );
  }
}

class NameAndDate extends StatelessWidget {
  const NameAndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              'Caso de san agustin',
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelLarge!.copyWith(
                  color: MainColorsApp.backgroundColorD,
                  fontWeight: FontWeight.bold),
            )),
        Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '10/12/2001',
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall!.copyWith(
                    color: MainColorsApp.backgroundColorD,
                    fontWeight: FontWeight.w400),
              ),
            )),
      ],
    );
  }
}
