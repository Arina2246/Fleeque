import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SettingsIconWidget extends StatelessWidget {
  const SettingsIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: BoldTextWidget(
          text: 'Settings', color: white, textAlign: TextAlign.center),
    );
  }
}
