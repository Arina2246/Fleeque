import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  const TextButtonWidget({Key? key, required this.callback, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: callback,
      child: ExtraBoldTextWidget(
          text: text, color: black, textAlign: TextAlign.center),
    );
  }
}
