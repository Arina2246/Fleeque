import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:core_ui/core_ui.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final int width;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;

  const ElevatedButtonWidget(
      {Key? key,
      required this.width,
      required this.borderColor,
      required this.backgroundColor,
      required this.textColor,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.toDouble(),
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.roboto(
            letterSpacing: .8,
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
