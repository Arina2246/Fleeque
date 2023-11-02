import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';

class InfluencerModel extends InfluencerEntity {
  const InfluencerModel({
    required final String name,
    required final int posts,
    required final int followers,
    required final String img,
    required final int basicPrice,
    required final String time,
    required final String country,
  }) : super(
          name: name,
          posts: posts,
          followers: followers,
          img: img,
          basicPrice: basicPrice,
          time: time,
          country: country,
        );

  factory InfluencerModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> querySnapshot) {
    return InfluencerModel(
      name: querySnapshot.get('name'),
      posts: querySnapshot.get('posts'),
      followers: querySnapshot.get('followers'),
      img: querySnapshot.get('img'),
      basicPrice: querySnapshot.get('basicPrice'),
      time: querySnapshot.get('time'),
      country: querySnapshot.get('country'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "posts": posts,
      "followers": followers,
      "img": img,
      "basicPrice": basicPrice,
      "time": time,
      "country": country,
    };
  }
}
