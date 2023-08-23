import 'package:fleeque/features/start_page/presentatiom/widgets/app_bar/app_bar.dart';
import 'package:fleeque/features/start_page/presentatiom/widgets/reserved_rights.dart';
import 'package:fleeque/features/start_page/presentatiom/widgets/welcome_splash/logo.dart';
import 'package:fleeque/features/start_page/presentatiom/widgets/welcome_splash/start_button.dart';
import 'package:flutter/material.dart';

class WelcomeSplashPage extends StatefulWidget {
  const WelcomeSplashPage({super.key});

  @override
  State<WelcomeSplashPage> createState() => _WelcomeSplashPage();
}

class _WelcomeSplashPage extends State<WelcomeSplashPage> {
  bool isOnline = false;
  bool isDiscontShown = false;
  bool isWalletShown = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isOnline = false;
      isDiscontShown = false;
      isWalletShown = false;
    });
  }

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
                  image: AssetImage('assets/images/welcome_influencer.png'))),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.33,
                ),
                const LogoWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                ),
                const StartButtonWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const ReservedRightsWidget(),
              ]),
        ));
  }
}
