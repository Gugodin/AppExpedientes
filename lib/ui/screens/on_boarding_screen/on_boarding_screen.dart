import 'package:auto_route/auto_route.dart';
import 'package:expedientes/config/colors/colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  final controller = PageController();

  final listWidgets = [Colors.orange, Colors.amber, Colors.cyan, Colors.indigo];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 1, child: PageIndicator(currentIndex: currentIndex)),
          Expanded(
              flex: 5,
              child: PageView.builder(
                controller: controller,
                itemCount: listWidgets.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: listWidgets[index],
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
              )),
        ],
      ),
    );
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
          (index) => Container(
            height: 5,
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
