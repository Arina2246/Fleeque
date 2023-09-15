import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/model/influencers.dart/influencers_model.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';

class FirebaseProvider {
  final FirebaseFirestore firestore;

  FirebaseProvider({required this.firestore});

  Stream<List<InfluencerEntity>> getInfluencersCollection() {
    final influencersCollectionRef = firestore.collection("influencers");

    return influencersCollectionRef.snapshots().map((querySnap) {
      return querySnap.docs
          .map((docSnap) => InfluencerModel.fromSnapshot(docSnap))
          .toList();
    });
  }
}
