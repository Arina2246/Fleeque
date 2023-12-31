import 'package:authentification/forgot_password_page/screens/forgot_password_screen.dart';
import 'package:contact/screens/contact_screen.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:authentification/sign_in_page/screens/sign_in_screen.dart';
import 'package:authentification/sign_up_page/screens/sign_up_screen.dart';
import 'package:about/screens/about_screen.dart';
import 'package:home/screens/home_screen.dart';
import 'package:influencers/screens/influencers_screen.dart';
import 'package:user/screens/user_screen.dart';
import 'package:welcome/welcome.dart';
import 'package:carousel/carousel.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case welcomeRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const WelcomeScreen(),
      );
    case carouselRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const CarouselScreen(),
      );
    case signInRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const SignInScreen(),
      );
    case signUpRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const SignUpScreen(),
      );
    case forgotPasswordRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const ForgotPasswordScreen(),
      );
    case homeRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const HomeScreen(),
      );
    case influencersRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const InfluencersScreen(),
      );
    case aboutRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AboutScreen(),
      );
    case contactRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const ContactScreen(),
      );
    case userRoute:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const UserScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
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
