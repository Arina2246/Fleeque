import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to',
          style: GoogleFonts.montserrat(
            letterSpacing: 0,
            height: 1.5,
            color: white,
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        Image.asset('assets/images/welcome_screen/welcome_logo.png'),
      ],
    );
  }
}
