import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:nav_bar/screens/widgets/nav_button.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: black,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavButtonWidget(
            text: 'Home',
            inactiveImg: 'assets/images/home.png',
            activeImg: 'assets/images/home_filled.png',
            route: homeRoute,
          ),
          NavButtonWidget(
            text: 'Influencer',
            inactiveImg: 'assets/images/star.png',
            activeImg: 'assets/images/star_filled.png',
            route: influencersRoute,
          ),
          NavButtonWidget(
            text: 'About',
            inactiveImg: 'assets/images/about.png',
            activeImg: 'assets/images/about_filled.png',
            route: aboutRoute,
          ),
          NavButtonWidget(
            text: 'Contacts',
            inactiveImg: 'assets/images/contact.png',
            activeImg: 'assets/images/contact_filled.png',
            route: contactRoute,
          ),
        ],
      ),
    );

    //   onTap: (index) {
    //     switch (index) {
    //       case 0:
    //         Navigator.pushNamed(context, "/home");
    //         break;
    //       case 1:
    //         Navigator.pushNamed(context, "/influencers");
    //         break;
    //       case 2:
    //         Navigator.pushNamed(context, "/about");
    //         break;
    //       case 3:
    //         Navigator.pushNamed(context, "/contact");
    //         break;
    //     }
    //   },
    // )
  }
}
