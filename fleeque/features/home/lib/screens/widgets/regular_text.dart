import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegularTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  const RegularTextWidget({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: GoogleFonts.roboto(
        letterSpacing: 0,
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
