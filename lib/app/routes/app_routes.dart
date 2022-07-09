import 'package:crypto/screens/login/moible_signUp.dart';
import 'package:crypto/screens/login/signIn.dart';
import 'package:crypto/screens/login/signUp.dart';
import 'package:crypto/screens/login/success.dart';
import 'package:crypto/screens/onboarding/onboarding_screen.dart';
import 'package:crypto/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../screens/home/home.dart';
import '../../screens/home/menu.dart';

class AppRoutes {
  static const String splashScreenRoute = "/splashScreen";
  static const String onBoardingScreenRoute = "/onBoardingScreen";
  static const String signInScreenRoute = "/signInScrenn";
  static const String signUpRoute = "/signUp";
  static const String mobileSignUpRoute = "/mobileSignUp";
  static const String successSignUpScreenRoute = "successSignUp";
  static const String homeScreenRoute = "/homeScreen";
  static const String menuScreenRoute = "/menuScreen";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          );
        }
      case splashScreenRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const SpalashScreen(),
          );
        }
      case onBoardingScreenRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const OnBoardingScreen(),
          );
        }
      case signInScreenRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const SignInScreen(),
          );
        }
      case signUpRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const SignUp(),
          );
        }
      case mobileSignUpRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const MobileSignUp(),
          );
        }
      case successSignUpScreenRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const SuccessSignUpScreen(),
          );
        }
      case menuScreenRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const MenuScreen(),
          );
        }
    }
    return null;
  }
}
