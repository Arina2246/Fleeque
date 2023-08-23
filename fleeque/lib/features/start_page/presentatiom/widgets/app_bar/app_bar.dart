import 'package:fleeque/features/start_page/presentatiom/widgets/app_bar/discount_icon.dart';
import 'package:fleeque/features/start_page/presentatiom/widgets/app_bar/info_icon.dart';
import 'package:fleeque/features/start_page/presentatiom/widgets/app_bar/logo.dart';
import 'package:fleeque/features/start_page/presentatiom/widgets/app_bar/user_icon.dart';
import 'package:fleeque/features/start_page/presentatiom/widgets/app_bar/wallet_icon.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserIconWidget(isVisible: isOnline),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                if (isDiscontShown) const DiscountIconWidget()
              ],
            ),
          ),
          const LogoWidget(),
          SizedBox(
            width: 57,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isWalletShown) const WalletIconWidget(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                const InfoIconWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
