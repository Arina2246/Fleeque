import 'package:fleeque/features/start_page/presentatiom/widgets/app_bar.dart';
import 'package:fleeque/features/start_page/presentatiom/widgets/reserved_rights.dart';
import 'package:google_fonts/google_fonts.dart';
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
                SizedBox(
                  child: Text(
                    'Welcome to',
                    style: GoogleFonts.montserrat(
                      letterSpacing: 0,
                      height: 1.5,
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Image.asset('assets/images/logo_welcome_page.png'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.32,
                ),
                SizedBox(
                    width: 247,
                    height: 60,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(94.0),
                                    side: const BorderSide(
                                        color: Colors.white)))),
                        onPressed: () => print('start'),
                        child: Text(
                          'GET STARTED',
                          style: GoogleFonts.roboto(
                            letterSpacing: .8,
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ))),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const ReservedRightsWidget(),
              ]),
        ));
  }
}
