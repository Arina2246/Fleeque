import 'package:fleeque/features/carousel_feature/screens/widgets/dots_indicator_widget.dart';
import 'package:fleeque/features/carousel_feature/screens/widgets/skip_button_widget.dart';
import 'package:fleeque/features/carousel_feature/screens/widgets/text_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../constant_carousel_text.dart';

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
      backgroundColor: white,
      body: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1,
          onPageChanged: (page, _) => {
            setState(
              () => _currentPosition = page.toInt(),
            ),
          },
          enableInfiniteScroll: false,
        ),
        carouselController: buttonCarouselController,
        items: carouselText.map(
          (String text) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: white),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 15,
                        child: TextInfoWidget(carouselText: text),
                      ),
                      const Spacer(),
                      DotsIndicatorWidget(
                        dotsCount: carouselText.length,
                        currentPosition: _currentPosition,
                        handlePageTap: _handlePageTap,
                      ),
                      Expanded(
                        flex: 1,
                        child: SkipButtonWidget(
                            isLast: _currentPosition == carouselText.length
                                ? true
                                : false),
                      ),
                      const Spacer(),
                    ],
                  ),
                );
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
