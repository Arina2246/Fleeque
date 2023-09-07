import 'package:carousel_slider/carousel_slider.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:flutter/material.dart';
import 'package:influencers/screens/widgets/carousel_slider/carousel_card.dart';

class CarouselSliderWidget extends StatelessWidget {
  final List<InfluencerEntity> influencersCollection;
  const CarouselSliderWidget({Key? key, required this.influencersCollection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 179.0,
        enableInfiniteScroll: false,
      ),
      items: influencersCollection.map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return CarouselCardWidget(influencerData: i);
            },
          );
        },
      ).toList(),
    );
  }
}
