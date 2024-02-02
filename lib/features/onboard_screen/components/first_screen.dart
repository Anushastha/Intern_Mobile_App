import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  final VoidCallback onContinuePressed;

  const FirstScreen({Key? key, required this.onContinuePressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAFFCA),
      child: Column(
        children: [
          const SizedBox(height: 130),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  'Pre-Measured Ingredients',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Get Pre-measured ingredients delivered to your home to avoid the hassle of shopping for ingredients in today's busy world",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/ingredients.png',
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: onContinuePressed,
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
