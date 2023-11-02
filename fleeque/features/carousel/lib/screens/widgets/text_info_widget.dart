import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class TextInfoWidget extends StatelessWidget {
  final String carouselText;

  const TextInfoWidget({Key? key, required this.carouselText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: ExtraBoldTextWidget(
                text:
                    'Create the perfect shoutout to your friends from their favorite influencers',
                color: black,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
          ],
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 6,
              child: BoldTextWidget(
                text: carouselText,
                color: black,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
