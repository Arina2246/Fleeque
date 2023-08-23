import 'package:fleeque/features/start_page/presentatiom/pages/welcome_carousel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartButtonWidget extends StatelessWidget {
  const StartButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 247,
        height: 60,
        child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(94.0),
                        side: const BorderSide(color: Colors.white)))),
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const WelcomeCarouselPage())),
            child: Text(
              'GET STARTED',
              style: GoogleFonts.roboto(
                letterSpacing: .8,
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )));
  }
}
