import 'package:flutter/material.dart';
import 'package:intern_mobile_app/features/onboard_screen/components/first_screen.dart';
import 'package:intern_mobile_app/features/onboard_screen/components/second_screen.dart';
import 'package:intern_mobile_app/features/onboard_screen/components/third_screen.dart';

class PageViewComponent extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int>? onPageChanged;

  const PageViewComponent({
    Key? key,
    required this.pageController,
    this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: 3, // Number of screens
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return FirstScreen(onContinuePressed: () {
              pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
            });
          case 1:
            return SecondScreen(onContinuePressed: () {
              pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
            });
          case 2:
            return ThirdScreen();
          default:
            return Container();
        }
      },
    );
  }
}
