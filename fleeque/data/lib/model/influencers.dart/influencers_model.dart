import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';

class InfluencerModel extends InfluencerEntity {
  const InfluencerModel({
    required final String name,
    required final int posts,
    required final int followers,
    required final String imgBig,
    required final String imgSmall,
  }) : super(
          name: name,
          posts: posts,
          followers: followers,
          imgBig: imgBig,
          imgSmall: imgSmall,
        );

  factory InfluencerModel.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> querySnapshot) {
    return InfluencerModel(
      name: querySnapshot.get('name'),
      posts: querySnapshot.get('posts'),
      followers: querySnapshot.get('followers'),
      imgBig: querySnapshot.get('imgBig'),
      imgSmall: querySnapshot.get('imgSmall'),
    );
  }

  factory InfluencerModel.updateImg(
      InfluencerModel model, String imgBig, String imgSmall) {
    return InfluencerModel(
      name: model.name,
      posts: model.posts,
      followers: model.followers,
      imgBig: imgBig,
      imgSmall: imgSmall,
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "posts": posts,
      "followers": followers,
      "imgBig": imgBig,
      "imgSmall": imgSmall
    };
  }
}
