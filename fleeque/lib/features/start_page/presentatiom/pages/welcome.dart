import 'dart:async';
import 'package:fleeque/features/start_page/presentatiom/widgets/reserved_rights.dart';
import 'package:fleeque/features/start_page/presentatiom/pages/welcome_splash.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePage();
}

class _WelcomePage extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const WelcomeSplashPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.37,
                  ),
                  Image.asset('assets/images/logo_welcome_page.png'),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.43,
                  ),
                  const ReservedRightsWidget(),
                ])));
  }
}
