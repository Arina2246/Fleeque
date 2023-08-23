import 'package:fleeque/features/start_page/presentatiom/widgets/welcome_carousel/dots_indicator.dart';
import 'package:fleeque/features/start_page/presentatiom/widgets/welcome_carousel/skip_button.dart';
import 'package:fleeque/features/start_page/presentatiom/widgets/welcome_carousel/text_info.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../core/constants/welcome_carousel.dart';

class WelcomeCarouselPage extends StatefulWidget {
  const WelcomeCarouselPage({super.key});

  @override
  State<WelcomeCarouselPage> createState() => _WelcomeCarouselPage();
}

class _WelcomeCarouselPage extends State<WelcomeCarouselPage> {
  CarouselController buttonCarouselController = CarouselController();

  int _currentPosition = 0;

  void _handlePageTap(double pos) {
    setState(() => _currentPosition = pos.toInt());
    buttonCarouselController.animateToPage(_currentPosition);
  }

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
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      TextInfoWidget(item: i),
                      const Spacer(),
                      DotsIndicatorWidget(
                          dotsCount: items.length,
                          currentPosition: _currentPosition,
                          handlePageTap: _handlePageTap),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SkipButtonWidget(item: i),
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
