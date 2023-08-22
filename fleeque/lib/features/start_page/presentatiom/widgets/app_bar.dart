import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isOnline;
  final bool isDiscontShown;
  final bool isWalletShown;
  final bool isInformationShown;
  const AppBarWidget(
      {Key? key,
      required this.isOnline,
      required this.isDiscontShown,
      required this.isWalletShown,
      required this.isInformationShown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/user_icon.png'))),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 12,
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 12,
                    ),
                    if (isOnline)
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.8,
                        child: Image.asset('images/online_marker_icon.png'),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (isDiscontShown)
            IconButton(
              onPressed: () {
                print('discount');
              },
              icon: Image.asset('assets/images/discount_icon.png'),
            ),
          IconButton(
            onPressed: () {
              print('logo');
            },
            icon: Image.asset('assets/images/logo_app_bar.png'),
          ),
          if (isWalletShown)
            IconButton(
              onPressed: () {
                print('wallet');
              },
              icon: Image.asset('assets/images/wallet_icon.png'),
            ),
          if (isInformationShown)
            IconButton(
              onPressed: () {
                print('info');
              },
              icon: Image.asset('assets/images/info_icon.png'),
            ),
        ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
