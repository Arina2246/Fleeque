import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/model/influencers.dart/influencers_model.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseProvider {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  FirebaseProvider({required this.firestore, required this.storage});

  Future<List<InfluencerEntity>> getInfluencersCollection() async {
    final influencersCollectionRef = firestore.collection("influencers");
    List<InfluencerEntity> influencers =
        await influencersCollectionRef.get().then<dynamic>(
      (snapshot) async {
        List<InfluencerEntity> influencerDataList = [];
        for (var el in snapshot.docs) {
          var influencerData = InfluencerModel.fromSnapshot(el);
          influencerDataList.add(influencerData);
        }
        return influencerDataList;
      },
    );
    return influencers;
  }
}
