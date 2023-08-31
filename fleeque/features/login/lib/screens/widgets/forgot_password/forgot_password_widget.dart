import 'package:core/core.dart';
import 'package:core_ui/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(
        context,
        forgotPasswordRoute,
      ),
      child: Text(
        'Forgot password?',
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(
          decoration: TextDecoration.underline,
          decorationColor: grey,
          color: grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
