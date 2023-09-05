import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';
import 'package:home/screens/widgets/regular_text.dart';

class PopularButtonWidget extends StatelessWidget {
  const PopularButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 102,
      height: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: black,
          shadowColor: transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        onPressed: () {},
        child: const RegularTextWidget(
          text: 'popular',
          color: white,
        ),
      ),
    );
  }
}
