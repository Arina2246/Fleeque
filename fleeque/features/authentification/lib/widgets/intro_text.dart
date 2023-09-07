import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class IntroTextWidget extends StatelessWidget {
  final String text;
  const IntroTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          flex: 3,
          child: ExtraBoldTextWidget(
            text: text,
            color: black,
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
