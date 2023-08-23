import 'package:fleeque/features/start_page/presentatiom/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkipButtonWidget extends StatelessWidget {
  final Map<int, String> item;
  const SkipButtonWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      child: Text(
        '${item[2]}',
        style: GoogleFonts.roboto(
          decoration: TextDecoration.underline,
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
