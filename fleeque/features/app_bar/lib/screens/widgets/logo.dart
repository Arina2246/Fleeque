import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {}, child: Image.asset('assets/images/logo_app_bar.png'));
  }
}
