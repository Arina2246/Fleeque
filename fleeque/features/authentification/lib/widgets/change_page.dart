import 'package:core_ui/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePageWidget extends StatelessWidget {
  final String questionText;
  final String buttonText;
  final VoidCallback callback;

  const ChangePageWidget({
    Key? key,
    required this.questionText,
    required this.buttonText,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(
          questionText,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            color: black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: callback,
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              decoration: TextDecoration.underline,
              decorationColor: red,
              color: red,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
