import 'dart:async';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets/influencers/influencer_list/influencer_list.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:flutter/material.dart';
import 'package:influencers/screens/widgets/carousel_slider/carousel_slider.dart';
import 'package:influencers/screens/widgets/filter_button.dart';

class InfluencersWidget extends StatelessWidget {
  final List<InfluencerEntity> influencersCollection;
  final StreamController<Map<String, dynamic>> controller;

  const InfluencersWidget(
      {Key? key, required this.influencersCollection, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 90,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ExtraBoldTextWidget(
                    text: 'Influencers',
                    color: black,
                    textAlign: TextAlign.left),
                FilternButtonWidget(
                  controller: controller,
                ),
              ],
            ),
          ),
          CarouselSliderWidget(
            influencersCollection: influencersCollection,
          ),
          InfluencerListWidget(
            influencersCollection: influencersCollection,
            itemsCount: influencersCollection.length,
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Spacer(),
                Expanded(
                  flex: 5,
                  child: RegularTextWidget(
                    text: 'if you dont find influencer just let '
                        'us know and we will make sure they join Fleeque soon',
                    color: white,
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
        ],
      ),
    );
  }
}
