import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class FilternButtonWidget extends StatelessWidget {
  const FilternButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 24,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: transparent,
          shadowColor: transparent,
          elevation: 0,
        ),
        onPressed: () => {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/filter_icon.png',
                package: 'influencers'),
            const BoldTextWidget(
                text: 'Filter', color: black, textAlign: TextAlign.left),
          ],
        ),
      ),
    );
  }
}
