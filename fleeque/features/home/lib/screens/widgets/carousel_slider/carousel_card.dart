import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:flutter/material.dart';
import 'package:home/screens/widgets/carousel_slider/card_text.dart';

class CarouselCardWidget extends StatelessWidget {
  final InfluencerEntity influencerData;
  const CarouselCardWidget({Key? key, required this.influencerData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              influencerData.imgBig,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            const Spacer(),
            CardTextWidget(
              name: influencerData.name,
              followers: influencerData.followers,
              posts: influencerData.posts,
            ),
          ],
        ),
      ],
    );
  }
}
