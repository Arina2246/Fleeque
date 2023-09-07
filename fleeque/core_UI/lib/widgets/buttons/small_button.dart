import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class SmallButtonWidget extends StatelessWidget {
  final String text;

  const SmallButtonWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: black,
          shadowColor: transparent,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        onPressed: () {},
        child: RegularTextWidget(
          text: text,
          color: white,
        ),
      ),
    );
  }
}
