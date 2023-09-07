import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtraBoldTextWidget extends StatelessWidget {
  final Color color;
  final String text;
  final TextAlign textAlign;
  const ExtraBoldTextWidget(
      {Key? key,
      required this.text,
      required this.color,
      required this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
        letterSpacing: 0,
        color: color,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
