import 'package:core_ui/core_ui.dart';
import 'package:domain/entities/user/user_entities.dart';
import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  final UserEntity userData;
  const NameWidget({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RegularTextWidget(
            text: 'hello', color: black, textAlign: TextAlign.center),
        ExtraBoldTextWidget(
            text: userData.name ?? '',
            color: black,
            textAlign: TextAlign.center),
      ],
    );
  }
}
