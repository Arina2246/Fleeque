import 'package:fleeque/features/login_feature/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkipButtonWidget extends StatelessWidget {
  final bool isLast;
  const SkipButtonWidget({Key? key, required this.isLast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      child: Text(
        isLast ? 'DONE' : 'SKIP',
        style: GoogleFonts.roboto(
          decoration: TextDecoration.underline,
          color: black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
