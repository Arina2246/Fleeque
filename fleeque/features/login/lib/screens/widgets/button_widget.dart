import 'package:core_ui/colors/app_colors.dart';
import 'package:core_ui/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [gradientPink, gradientPurple],
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButtonWidget(
          width: 235,
          borderColor: transparent,
          backgroundColor: transparent,
          textColor: white,
          text: text,
          onPressed: callback),
    );
  }
}
