import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoldTextWidget extends StatelessWidget {
  final Color color;
  final String text;
  final TextAlign textAlign;
  const BoldTextWidget(
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
      style: GoogleFonts.roboto(
        letterSpacing: 0,
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
