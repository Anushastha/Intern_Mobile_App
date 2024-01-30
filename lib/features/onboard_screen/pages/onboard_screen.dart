import 'package:flutter/material.dart';
import 'package:page_view_sliding_indicator/page_view_sliding_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  List<OnBoard> onBoardList = [
    OnBoard(
      title: 'Pre-Measured Ingredients',
      des:
      "Get Pre-measured ingredients delivered to your home to avoid the hassle of shopping for ingredients in today's busy world",
      imageAssets: 'assets/images/ingredients.png',
    ),
    OnBoard(
      title: 'Cooking Made Easy',
      des:
      "Each recipe comes with step-by-step instructions and pre-portioned ingredients, making the cooking process simple and enjoyable.",
      imageAssets: 'assets/images/cook.png',
    ),
    OnBoard(
      title: 'Variety',
      des:
      "A wide range of recipes each week, including vegetarian, low-calorie, family-friendly, and gourmet options.",
      imageAssets: 'assets/images/cooked_food.png',
    ),
  ];

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
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: onBoardList.length,
                  itemBuilder: (context, index) {
                    final onBoard = onBoardList[index];
                    return Container(
                      color: const Color(0xFFEAFFCA),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 150),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                children: [
                                  Text(
                                    onBoard.title,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    onBoard.des,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              onBoard.imageAssets,
                              fit: BoxFit.contain,
                            ),
                            if (_currentPage == 0 || _currentPage == 1)
                              SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                            if (_currentPage == 2)
                              Column(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
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
          if (_currentPage > 0)
            Positioned(
              bottom: 10,
              left: 20,
              child: _buildButton(
                Icons.arrow_back_ios,
                    () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          if (_currentPage < onBoardList.length - 1)
            Positioned(
              bottom: 10,
              right: 20,
              child: _buildButton(
                Icons.arrow_forward_ios,
                    () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          Positioned(
            top: 60,
            left: 20,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PageViewSlidingIndicator(
                color: Colors.green,
                size: 10,
                controller: _pageController,
                pageCount: onBoardList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.green,
          size: 32,
        ),
      ),
    );
  }
}

class OnBoard {
  String title;
  String des;
  String imageAssets;

  OnBoard({
    required this.title,
    required this.des,
    required this.imageAssets,
  });
}
