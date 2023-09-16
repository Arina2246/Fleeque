import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/model/influencers.dart/influencers_model.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:domain/entities/filter/filter_entities.dart';

class FirebaseProvider {
  final FirebaseFirestore firestore;
  StreamController<List<InfluencerEntity>> controller =
      StreamController<List<InfluencerEntity>>();
  late Stream<List<InfluencerEntity>> stream =
      controller.stream.asBroadcastStream();

  FirebaseProvider({required this.firestore});

  Stream<QuerySnapshot<Map<String, dynamic>>> getInfluencersRef() {
    return firestore.collection("influencers").snapshots();
  }

  Stream<List<InfluencerEntity>> getInfluencersCollection() {
    final influencersCollectionStream = getInfluencersRef();
    influencersCollectionStream.listen((event) {
      controller.add(
        event.docs
            .map((docSnap) => InfluencerModel.fromSnapshot(docSnap))
            .toList(),
      );
    });
    return stream;
  }

  void filterInfluencersCollection(FilterEntity filterValues) {}

  // Future<void> filterData(Emitter emit, Map<String, dynamic> filters) async {
  //   var collectionCopy = [...collection];
  //   if (filters['time'] == timeNewest) {
  //     collectionCopy.sort(
  //         (a, b) => DateTime.parse(a.time).compareTo(DateTime.parse(b.time)));
  //   } else if (filters['time'] == timeOldest) {
  //     collectionCopy.sort(
  //         (b, a) => DateTime.parse(a.time).compareTo(DateTime.parse(b.time)));
  //   } else if (filters['price'] == priceLowToHigh) {
  //     collectionCopy.sort((a, b) => a.basicPrice.compareTo(b.basicPrice));
  //   } else if (filters['price'] == priceHighToLow) {
  //     collectionCopy.sort((b, a) => a.basicPrice.compareTo(b.basicPrice));
  //   }
  //   if (filters['search'] != '') {
  //     collectionCopy = collectionCopy
  //         .where(
  //           (el) => el.name.toLowerCase().contains(
  //                 filters['search'].toLowerCase(),
  //               ),
  //         )
  //         .toList();
  //   }
  //   if (filters['followers'] == followersOverMillion) {
  //     collectionCopy = collectionCopy
  //         .where(
  //           (el) => el.followers > 999999,
  //         )
  //         .toList();
  //   }
  //   if (filters['followers'] == followersUnderMillion) {
  //     collectionCopy = collectionCopy
  //         .where(
  //           (el) => el.followers < 1000000,
  //         )
  //         .toList();
  //   }
  //   if (filters['country'] != countrySelect) {
  //     collectionCopy = collectionCopy
  //         .where(
  //           (el) => el.country.toLowerCase().contains(
  //                 filters['country'].toLowerCase(),
  //               ),
  //         )
  //         .toList();
  //   }
  //   emit(
  //     InfluencersState(
  //       influencersCollection: collectionCopy,
  //       isLoading: false,
  //       isError: false,
  //     ),
  //   );
  // }
}
