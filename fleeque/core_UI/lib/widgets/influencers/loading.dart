import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class LoadingInfluencersWidget extends StatelessWidget {
  const LoadingInfluencersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(black),
            ),
          ],
        ),
      ],
    );
  }
}
