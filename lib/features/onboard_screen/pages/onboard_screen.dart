import 'package:flutter/material.dart';

import '../components/page_view_component.dart';
import '../components/page_view_sliding_indicator.dart';
import '../components/skip_component.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  // Define a controller for the PageView
  final PageController _pageController = PageController();

  // Index for the current page
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          PageViewComponent(
            pageController: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Visibility(
              visible: _currentPage < 2,
              child: SkipButton(
                onPressed: () {
                  _pageController.jumpToPage(2);
                },
              ),
            ),
          ),
          Positioned(
            left: 160,
            right: 0,
            bottom: 130,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PageViewSlidingIndicatorComponent(
                color: Colors.green,
                size: 10,
                controller: _pageController,
                spacing: 10,
                pageCount: 3, // Number of pages
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom_food.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
