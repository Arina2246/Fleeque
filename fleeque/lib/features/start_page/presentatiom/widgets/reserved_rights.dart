import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReservedRightsWidget extends StatelessWidget {
  const ReservedRightsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '© ALL RIGHTS RESERVED',
      style: GoogleFonts.roboto(
        letterSpacing: .8,
        height: 16,
        color: Colors.white,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
