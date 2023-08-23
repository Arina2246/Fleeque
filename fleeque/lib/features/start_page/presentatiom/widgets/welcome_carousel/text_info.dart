import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInfoWidget extends StatelessWidget {
  final Map<int, String> item;

  const TextInfoWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Text(
            '${item[0]}',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.23,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            '${item[1]}',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
