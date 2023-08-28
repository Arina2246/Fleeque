import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:welcome/welcome.dart';
import 'package:carousel/carousel.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case welcomeRoute:
      return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    case carouselRoute:
      return MaterialPageRoute(builder: (_) => const CarouselScreen());
    case loginRoute:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
