import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleSignInButtonWidget extends StatelessWidget {
  final VoidCallback callback;

  const GoogleSignInButtonWidget({Key? key, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343,
      height: 60,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: transparent,
            shadowColor: transparent,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          onPressed: () => callback(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 16,
                child: Text(
                  'Sign in with Google',
                  style: GoogleFonts.roboto(
                    letterSpacing: .8,
                    color: black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Image.asset('assets/images/line_icon.png',
                    package: 'authentification'),
              ),
              Expanded(
                flex: 2,
                child: Image.asset('assets/images/google_icon.png',
                    package: 'authentification'),
              )
            ],
          )),
    );
  }
}
