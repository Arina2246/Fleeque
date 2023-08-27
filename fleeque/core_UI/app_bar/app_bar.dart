import 'package:flutter/material.dart';

import 'discount_icon.dart';
import 'info_icon.dart';
import 'logo.dart';
import 'user_icon.dart';
import 'wallet_icon.dart';

import '../colors/colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isOnline;
  final bool isDiscontShown;
  final bool isWalletShown;
  const AppBarWidget(
      {Key? key,
      required this.isOnline,
      required this.isDiscontShown,
      required this.isWalletShown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: transparent,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                UserIconWidget(isOnline: isOnline),
                const Spacer(),
                if (isDiscontShown) const DiscountIconWidget()
              ],
            ),
          ),
          const Spacer(),
          const LogoWidget(),
          const Spacer(),
          Expanded(
            child: Row(
              children: [
                if (isWalletShown) const WalletIconWidget(),
                const Spacer(),
                const InfoIconWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
