import 'package:core_ui/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  final bool obscureText;
  final String labelText;
  final TextEditingController controller;

  const InputWidget({
    Key? key,
    required this.obscureText,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 12,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.all(0),
              labelStyle: GoogleFonts.roboto(
                color: black,
                letterSpacing: 0.05,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: black),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: black),
              ),
              labelText: labelText,
            ),
            obscureText: obscureText,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
