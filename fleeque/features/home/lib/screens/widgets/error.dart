import 'package:flutter/material.dart';

class ErrorHomeWidget extends StatelessWidget {
  const ErrorHomeWidget({
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
            Text('Something went wrong. '
                'Reload the page please'),
          ],
        ),
      ],
    );
  }
}
