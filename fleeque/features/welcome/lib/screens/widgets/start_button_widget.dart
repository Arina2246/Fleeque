import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:colors/colors.dart';
import 'package:carousel/carousel.dart';

class StartButtonWidget extends StatelessWidget {
  const StartButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 247,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(black),
          backgroundColor: MaterialStateProperty.all<Color>(white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(94.0),
              side: const BorderSide(color: white),
            ),
          ),
        ),
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const CarouselScreen(),
          ),
        ),
        child: Text(
          'GET STARTED',
          style: GoogleFonts.roboto(
            letterSpacing: .8,
            color: black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
