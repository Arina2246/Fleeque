import 'package:app_bar/app_bar.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:nav_bar/screens/nav_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        backgroundColor: black,
        isOnline: true,
        isDiscontShown: true,
        isWalletShown: true,
        isUserShown: true,
        isLogoShown: true,
        isInfoShown: true,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        children: const [
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              SmallButtonWidget(
                text: 'ALL ABOUT',
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ExtraBoldTextWidget(
              text: 'The new era of shoutouts',
              color: black,
              textAlign: TextAlign.left),
          SizedBox(
            height: 15,
          ),
          BoldTextWidget(
              text:
                  'Is it your friends birthday, graduation, bachelorette party '
                  'or maybe you just want a shoutout from your favorite influencers?',
              color: black,
              textAlign: TextAlign.left),
          SizedBox(
            height: 20,
          ),
          BoldTextWidget(
              text:
                  'On Fleeque you buy your greetings for these occasions and the '
                  'influencers will record a video and tag you or your friend on '
                  'that special day and upload it to their story for the world to see.',
              color: black,
              textAlign: TextAlign.left),
          SizedBox(
            height: 40,
          ),
          ExtraBoldTextWidget(
              text: 'How it works?', color: black, textAlign: TextAlign.left),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SmallButtonWidget(
                text: 'STEP 01',
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          BoldTextWidget(
              text: 'You simply find your favorite influencer.',
              color: black,
              textAlign: TextAlign.left),
          SizedBox(
            height: 15,
          ),
          RegularTextWidget(
              textAlign: TextAlign.left,
              text: 'if  dont find them just let us know and '
                  'we will make sure they join Fleeque soon',
              color: black),
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              SmallButtonWidget(
                text: 'STEP 02',
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          BoldTextWidget(
              text:
                  'Create your account, and fill in the greeting information, '
                  'once the message has been posted on your special day, the payment will processed.',
              color: black,
              textAlign: TextAlign.left),
          SizedBox(
            height: 50,
          ),
          RegularTextWidget(
              textAlign: TextAlign.left,
              text: 'Remember, here at fleeque its a bit of a first '
                  'come first serve policy so make sue you that you`re quick.',
              color: black),
          SizedBox(
            height: 15,
          ),
          RegularTextWidget(
              textAlign: TextAlign.left,
              text:
                  'Each influencer will only do 10 services month so you better be quick to join.',
              color: black),
          SizedBox(
            height: 70,
          ),
          ExtraBoldTextWidget(
              text: 'Enjoy and welcome to the Fleeque family!',
              color: black,
              textAlign: TextAlign.left),
          SizedBox(
            height: 70,
          ),
        ],
      ),
      bottomNavigationBar: const NavBarWidget(),
    );
  }
}
