import 'package:core_ui/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const TextInputWidget({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: TextFormField(
        style: const TextStyle(color: white),
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(0),
          labelStyle: GoogleFonts.roboto(
            letterSpacing: 0,
            color: white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: white,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: black),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: black),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
