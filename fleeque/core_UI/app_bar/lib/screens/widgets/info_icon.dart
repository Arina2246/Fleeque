import 'package:flutter/material.dart';

class InfoIconWidget extends StatelessWidget {
  const InfoIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/info_icon.png', package: 'app_bar'),
        ],
      ),
    );
  }
}
