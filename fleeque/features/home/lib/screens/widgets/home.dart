import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets/influencers/influencer_list/influencer_list.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:flutter/material.dart';
import 'package:home/screens/widgets/carousel_slider/carousel_slider.dart';

class HomeWidget extends StatelessWidget {
  final List<InfluencerEntity> influencersCollection;
  const HomeWidget({Key? key, required this.influencersCollection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width * 0.85,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallButtonWidget(
                  text: 'POPULAR',
                ),
                BoldTextWidget(
                  textAlign: TextAlign.left,
                  text: 'Swipe to explore Influencers',
                  color: black,
                ),
              ],
            ),
          ),
          CarouselSliderWidget(
            influencersCollection: influencersCollection,
          ),
          InfluencerListWidget(
            influencersCollection: influencersCollection,
            itemsCount: 4,
          ),
          ElevatedButtonWidget(
            width: (MediaQuery.of(context).size.width * 0.85).toInt(),
            borderColor: black,
            backgroundColor: black,
            textColor: white,
            text: 'SEE MORE',
            onPressed: () => {
              Navigator.pushNamed(context, influencersRoute),
            },
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
        ],
      ),
    );
  }
}
