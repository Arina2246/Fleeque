import 'package:authentification/forgot_password_page/screens/forgot_password_screen.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:authentification/sign_in_page/screens/sign_in_screen.dart';
import 'package:authentification/sign_up_page/screens/sign_up_screen.dart';
import 'package:home/screens/home_screen.dart';
import 'package:welcome/welcome.dart';
import 'package:carousel/carousel.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case welcomeRoute:
      return MaterialPageRoute(
        builder: (_) => const WelcomeScreen(),
      );
    case carouselRoute:
      return MaterialPageRoute(
        builder: (_) => const CarouselScreen(),
      );
    case signInRoute:
      return MaterialPageRoute(
        builder: (_) => const SignInScreen(),
      );
    case signUpRoute:
      return MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
      );
    case forgotPasswordRoute:
      return MaterialPageRoute(
        builder: (_) => const ForgotPasswordScreen(),
      );
    case homeRoute:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

// картинка кнопки гугла
