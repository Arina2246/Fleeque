import 'package:core_ui/widgets/influencers/influencer_list/influencer_list_card.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:flutter/material.dart';

class InfluencerListWidget extends StatelessWidget {
  final List<InfluencerEntity> influencersCollection;
  const InfluencerListWidget({Key? key, required this.influencersCollection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: (4),
          padding: const EdgeInsets.only(bottom: 30),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InfluencerListCardWidget(
                influencerData: influencersCollection[index],
              ),
            );
          }),
    );
  }
}
