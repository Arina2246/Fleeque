import 'package:flutter/material.dart';

class ImageIconWidget extends StatelessWidget {
  const ImageIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 135.0,
      height: 135.0,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}
