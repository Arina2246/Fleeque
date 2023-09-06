import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavButtonWidget extends StatelessWidget {
  final String text;
  final String inactiveImg;
  final String activeImg;
  final String route;
  const NavButtonWidget(
      {Key? key,
      required this.text,
      required this.inactiveImg,
      required this.activeImg,
      required this.route})
      : super(key: key);

  String chooseImage(context) {
    var currentRoute = ModalRoute.of(context)!.settings.name;
    return currentRoute == route ? activeImg : inactiveImg;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: black),
      onPressed: () => Navigator.pushNamed(context, route),
      child: Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image(
              image: AssetImage(chooseImage(context), package: 'nav_bar'),
            ),
          ),
          Text(
            text,
            style: GoogleFonts.roboto(
              letterSpacing: 0,
              color: white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
