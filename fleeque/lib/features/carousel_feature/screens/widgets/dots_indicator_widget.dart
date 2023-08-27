import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class DotsIndicatorWidget extends StatelessWidget {
  final int dotsCount;
  final int currentPosition;
  final void Function(double) handlePageTap;

  const DotsIndicatorWidget(
      {Key? key,
      required this.dotsCount,
      required this.currentPosition,
      required this.handlePageTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: const DotsDecorator(
        size: Size.square(6.0),
        activeSize: Size.square(6.0),
        color: inactiveColor,
        activeColor: activeColor,
      ),
      dotsCount: dotsCount,
      position: currentPosition.toDouble(),
      axis: Axis.horizontal,
      onTap: (pos) {
        handlePageTap(pos);
      },
    );
  }
}
