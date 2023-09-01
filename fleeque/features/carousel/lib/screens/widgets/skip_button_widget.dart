import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';

class SkipButtonWidget extends StatelessWidget {
  final bool isLast;
  const SkipButtonWidget({Key? key, required this.isLast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, authenticationRoute,
            arguments: signInRoute);
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
