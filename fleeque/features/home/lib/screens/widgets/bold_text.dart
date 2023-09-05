import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';

class BoldTextWidget extends StatelessWidget {
  final String text;
  const BoldTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        letterSpacing: 0,
        color: black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
