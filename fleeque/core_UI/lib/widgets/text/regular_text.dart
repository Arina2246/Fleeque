import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegularTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final TextAlign textAlign;
  const RegularTextWidget(
      {Key? key,
      required this.text,
      required this.color,
      required this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        letterSpacing: 0,
        color: color,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
