import 'package:flutter/material.dart';

class DiscountIconWidget extends StatelessWidget {
  const DiscountIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Image.asset('assets/images/discount_icon.png')],
      ),
    );
  }
}
