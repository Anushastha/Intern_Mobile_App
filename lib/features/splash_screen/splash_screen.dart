import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  bool animationStopped = false;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        animationStopped = true;
      });
      Navigator.pushNamed(context, AppRoute.onBoardRoute);
    });
  }

  @override
  void dispose() {
    // Dispose of the timer to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Lottie.asset(
                  'assets/animation/animation.json',
                repeat: true,
                animate: !animationStopped,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
