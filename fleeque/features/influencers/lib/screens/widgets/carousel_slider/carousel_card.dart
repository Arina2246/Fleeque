import 'package:core_ui/core_ui.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:flutter/material.dart';

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
          child: Container(
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: NetworkImage(
                  influencerData.img,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          children: [
            const Spacer(),
            const Spacer(),
            Expanded(
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 10,
                    child: ExtraBoldTextWidget(
                      text: influencerData.name,
                      color: white,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
