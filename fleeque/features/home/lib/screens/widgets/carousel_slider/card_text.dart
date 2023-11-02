import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CardTextWidget extends StatelessWidget {
  final String name;
  final int followers;
  final int posts;
  const CardTextWidget(
      {Key? key,
      required this.name,
      required this.followers,
      required this.posts})
      : super(key: key);

  formatFollowersCount(int count) {
    return count >= 1000000
        ? '${(count / 1000000)} M'
        : '${(count / 1000).toStringAsFixed(0)} K';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.bottomCenter,
      child: Column(
        children: [
          ExtraBoldTextWidget(
            textAlign: TextAlign.left,
            text: name,
            color: white,
          ),
          const Spacer(),
          RegularTextWidget(
            textAlign: TextAlign.left,
            text: '${formatFollowersCount(followers).toString()} FOLLOWERS',
            color: white,
          ),
          RegularTextWidget(
            textAlign: TextAlign.left,
            text: '${posts.toString()} POSTS',
            color: white,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
