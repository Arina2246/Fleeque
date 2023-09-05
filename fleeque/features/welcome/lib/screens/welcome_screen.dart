import 'package:app_bar/app_bar.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:welcome/screens/widgets/logo_widget.dart';
import 'package:welcome/screens/widgets/reserved_rights_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeSplashPage();
}

class _WelcomeSplashPage extends State<WelcomeScreen> {
  bool isOnline = false;
  bool isDiscontShown = false;
  bool isWalletShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        backgroundColor: transparent,
        isOnline: isOnline,
        isDiscontShown: isDiscontShown,
        isWalletShown: isWalletShown,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/welcome_ios_influencer.png',
                package: 'welcome'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Spacer(),
            const Expanded(
              flex: 2,
              child: LogoWidget(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButtonWidget(
                    width: 247,
                    borderColor: white,
                    backgroundColor: white,
                    textColor: black,
                    text: 'GET STARTED',
                    onPressed: () =>
                        Navigator.pushNamed(context, carouselRoute),
                  ),
                  const ReservedRightsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
