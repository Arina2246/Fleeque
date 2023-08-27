import 'package:flutter/material.dart';

class WalletIconWidget extends StatelessWidget {
  const WalletIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Image.asset('assets/images/app_bar/wallet_icon.png')],
      ),
    );
  }
}
