import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeCarouselPage extends StatefulWidget {
  const WelcomeCarouselPage({super.key});

  @override
  State<WelcomeCarouselPage> createState() => _WelcomeCarouselPage();
}

class _WelcomeCarouselPage extends State<WelcomeCarouselPage> {
  CarouselController buttonCarouselController = CarouselController();
  final items = [
    {
      0: 'Create the perfect shoutout to your friends from their favorite influencers',
      1: 'Is it your friends birthday and you want to get her something unforgettable. Why not buy her a birthday greeting from her favorite influencer?',
      2: 'SKIP',
    },
    {
      0: 'Create the perfect shoutout to your friends from their favorite influencers',
      1: 'Is your friend getting married and you want to send her a little extra special wedding wish? Who better than her favorite celebrity?',
      2: 'SKIP'
    },
    {
      0: 'Create the perfect shoutout to your friends from their favorite influencers',
      1: 'Have you dreamt about appearing on the instagram story of your favorite influencer, why not buy a shoutout on her story tagging you for the world to see?',
      2: 'DONE'
    }
  ];
  int _currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1,
          onPageChanged: (page, _) =>
              {setState(() => _currentPosition = page.toInt())},
          enableInfiniteScroll: false,
        ),
        carouselController: buttonCarouselController,
        items: items.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          '${i[0]}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.23,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          '${i[1]}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Spacer(),
                      DotsIndicator(
                        decorator: const DotsDecorator(
                          size: Size.square(6.0),
                          activeSize: Size.square(6.0),
                          color: Colors.grey,
                          // Inactive color
                          activeColor: Colors.black,
                        ),
                        dotsCount: items.length,
                        position: _currentPosition.toDouble(),
                        axis: Axis.horizontal,
                        onTap: (pos) {
                          setState(() => _currentPosition = pos.toInt());
                          buttonCarouselController
                              .animateToPage(_currentPosition);
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        '${i[2]}',
                        style: GoogleFonts.roboto(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                    ],
                  ));
            },
          );
        }).toList(),
      ),
    );
  }
}
