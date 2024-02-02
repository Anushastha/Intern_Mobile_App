import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final VoidCallback onContinuePressed;

  const SecondScreen({Key? key, required this.onContinuePressed}) : super(key: key);

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
                  'Cooking Made Easy',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Each recipe comes with step-by-step instructions and pre-portioned ingredients, making the cooking process simple and enjoyable.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/images/cook.png',
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
