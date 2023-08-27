import 'package:fleeque/features/welcome_feature/screens/widgets/logo_widget.dart';
import 'package:fleeque/features/welcome_feature/screens/widgets/reserved_rights_widget.dart';
import 'package:fleeque/features/welcome_feature/screens/widgets/start_button_widget.dart';
import 'package:flutter/material.dart';

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
            image: AssetImage(
              'assets/images/welcome_screen/welcome_ios_influencer.png',
            ),
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Spacer(),
            Expanded(
              flex: 2,
              child: LogoWidget(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [StartButtonWidget(), ReservedRightsWidget()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
