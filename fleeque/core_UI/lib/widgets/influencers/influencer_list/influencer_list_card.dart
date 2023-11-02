import 'package:core_ui/core_ui.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfluencerListCardWidget extends StatelessWidget {
  final InfluencerEntity influencerData;
  const InfluencerListCardWidget({Key? key, required this.influencerData})
      : super(key: key);

  formatFollowersCount(int count) {
    return count >= 1000000
        ? '${(count / 1000000)} M'
        : '${(count / 1000).toStringAsFixed(0)} K';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 75,
          height: 75,
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 1.07,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                alignment: FractionalOffset.topCenter,
                influencerData.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 10,
          child: Column(
            children: [
              Row(
                children: [
                  BoldTextWidget(
                    text: influencerData.name,
                    color: black,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RegularTextWidget(
                    text: 'FOLLOWERS',
                    color: black,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    formatFollowersCount(influencerData.followers),
                    style: GoogleFonts.roboto(
                      letterSpacing: 0,
                      color: black,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RegularTextWidget(
                    text: 'POSTS',
                    color: black,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    influencerData.posts.toString(),
                    style: GoogleFonts.roboto(
                      letterSpacing: 0,
                      color: black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
