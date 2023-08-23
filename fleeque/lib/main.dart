import 'package:fleeque/features/start_page/presentatiom/pages/welcome.dart';
import 'package:fleeque/features/start_page/presentatiom/pages/welcome_carousel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fleeque',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      // home: const WelcomePage(),
      home: const WelcomeCarouselPage(),
    );
  }
}
