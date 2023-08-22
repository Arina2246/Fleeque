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
                SizedBox(
                  height: 26,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/images/user_icon.png'))),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                if (isOnline)
                                  SizedBox(
                                    child: Image.asset(
                                        'images/online_marker_icon.png'),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                if (isDiscontShown)
                  SizedBox(
                    height: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/discount_icon.png')
                      ],
                    ),
                  ),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {},
              child: Image.asset('assets/images/logo_app_bar.png')),
          SizedBox(
            width: 57,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isWalletShown)
                  SizedBox(
                    height: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Image.asset('assets/images/wallet_icon.png')],
                    ),
                  ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                SizedBox(
                  height: 26,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Image.asset('assets/images/info_icon.png')],
                  ),
                ),
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
