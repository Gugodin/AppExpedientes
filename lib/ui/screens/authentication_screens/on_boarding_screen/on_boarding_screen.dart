import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../config/config.dart';
import '../../../commons/commons.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: PageIndicator(currentIndex: currentIndex)),
          Expanded(
              flex: 5,
              child: PageView.builder(
                controller: controller,
                itemCount: listImages.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Container(
                            width: size.width * 0.8,
                            height: size.height * 0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(listImages[index]))),
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      listTitleOnBoarding[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Text(
                                      listDescriptionOnBoarding[index],
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!,
                                    ),
                                  )),
                            ],
                          )),
                    ],
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
              )),
          Expanded(
              flex: 2,
              child: Center(
                child: currentIndex > 0
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomCircleButton(
                            icon: Icons.arrow_back,
                            colorIcon: MainColorsApp.backgroundColorD,
                            onTap: () => decrementCurrentPage(),
                          ),
                          SizedBox(
                            width: size.width * 0.6,
                            height: size.height * 0.09,
                            child: CustomElevatedButton(
                              colorLabel: MainColorsApp.backgroundColorD,
                              label: 'Siguiente',
                              onTap: () => incrementCurrentPage(),
                            ),
                          )
                        ],
                      )
                    : SizedBox(
                        height: size.height * 0.09,
                        child: CustomElevatedButton(
                          colorLabel: MainColorsApp.backgroundColorD,
                          label: 'Siguiente',
                          margin: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          onTap: () => incrementCurrentPage(),
                        ),
                      ),
              )),
        ],
      ),
    );
  }

  void incrementCurrentPage() {
    if (currentIndex < listImages.length - 1) {
      setState(() {
        currentIndex++;
      });
      controller.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 800), curve: Curves.linear);
    } else {
      context.router.push(LoginRoute());
    }
  }

  void decrementCurrentPage() {
    setState(() {
      currentIndex--;
    });
    controller.animateToPage(currentIndex,
        duration: const Duration(milliseconds: 800), curve: Curves.linear);
  }
}

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  const PageIndicator({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(
          4,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: index == currentIndex ? 6 : 5,
            width: size.width * 0.21,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: index == currentIndex
                    ? MainColorsApp.brightColor
                    : MainColorsApp.brightColor.withOpacity(0.3)),
          ),
        ),
      ),
    );
  }
}
