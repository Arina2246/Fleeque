import 'package:app_bar/screens/widgets/back_button.dart';
import 'package:app_bar/screens/widgets/discount_icon.dart';
import 'package:app_bar/screens/widgets/info_icon.dart';
import 'package:app_bar/screens/widgets/logo.dart';
import 'package:app_bar/screens/widgets/user_icon.dart';
import 'package:app_bar/screens/widgets/wallet_icon.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isOnline;
  final bool isDiscontShown;
  final bool isWalletShown;
  final bool isUserShown;
  final bool isLogoShown;
  final bool isInfoShown;
  final Color backgroundColor;
  const AppBarWidget(
      {Key? key,
      required this.isOnline,
      required this.isDiscontShown,
      required this.isWalletShown,
      required this.isUserShown,
      required this.isLogoShown,
      required this.isInfoShown,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                if (isUserShown) ...[
                  const Spacer(),
                  UserIconWidget(isOnline: isOnline),
                  const Spacer(),
                  if (isDiscontShown) const DiscountIconWidget(),
                ] else ...[
                  const BackButtonWidget(),
                  const Spacer(),
                ]
              ],
            ),
          ),
          const Spacer(),
          if (isLogoShown) const LogoWidget(),
          const Spacer(),
          Expanded(
            child: Row(
              children: [
                if (isWalletShown) const WalletIconWidget(),
                const Spacer(),
                if (isInfoShown) const InfoIconWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
