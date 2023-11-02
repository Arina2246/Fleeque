import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:core_ui/core_ui.dart';
import 'package:carousel/screens/widgets/dots_indicator_widget.dart';
import 'package:carousel/screens/widgets/skip_button_widget.dart';
import 'package:carousel/screens/widgets/text_info_widget.dart';

import 'constant_carousel_text.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreen();
}

class _CarouselScreen extends State<CarouselScreen> {
  CarouselController buttonCarouselController = CarouselController();

  int _currentPosition = 0;

  void _handlePageTap(double pos) {
    setState(
      () => _currentPosition = pos.toInt(),
    );
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
                            isLast: _currentPosition == carouselText.length - 1
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
