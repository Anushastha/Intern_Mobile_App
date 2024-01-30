import 'package:intern_mobile_app/features/onboard_screen/pages/onboard_screen.dart';
import 'package:intern_mobile_app/features/splash_screen/splash_screen.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String onBoardRoute = '/onBoard';


  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashScreen(),
      onBoardRoute: (context) => const OnboardScreen(),

    };
  }
}
