import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:colors/colors.dart';

class TextInfoWidget extends StatelessWidget {
  final String carouselText;

  const TextInfoWidget({Key? key, required this.carouselText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Text(
                'Create the perfect shoutout to your friends from their favorite influencers',
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
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 6,
              child: Text(
                carouselText,
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
