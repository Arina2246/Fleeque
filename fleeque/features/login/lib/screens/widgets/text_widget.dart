import 'package:core_ui/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 3,
          child: Text(
            '$text with your credentials',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: black,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
