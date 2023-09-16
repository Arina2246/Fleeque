import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/filters/filters_constants.dart';
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

  void filterInfluencersCollection(FilterEntity filterValues) {
    final influencersCollectionStream = getInfluencersRef();
    influencersCollectionStream.listen((event) {
      var list = event.docs
          .map((docSnap) => InfluencerModel.fromSnapshot(docSnap))
          .toList();
      if (filterValues.timeSorting == timeNewest) {
        list.sort(
            (a, b) => DateTime.parse(a.time).compareTo(DateTime.parse(b.time)));
      } else if (filterValues.timeSorting == timeOldest) {
        list.sort(
            (b, a) => DateTime.parse(a.time).compareTo(DateTime.parse(b.time)));
      } else if (filterValues.priceSorting == priceLowToHigh) {
        list.sort((a, b) => a.basicPrice.compareTo(b.basicPrice));
      } else if (filterValues.priceSorting == priceHighToLow) {
        list.sort((b, a) => a.basicPrice.compareTo(b.basicPrice));
      }
      if (filterValues.searchText != '') {
        list = list
            .where(
              (el) => el.name.toLowerCase().contains(
                    filterValues.searchText.toLowerCase(),
                  ),
            )
            .toList();
      }
      if (filterValues.followersFiltering == followersOverMillion) {
        list = list
            .where(
              (el) => el.followers > 999999,
            )
            .toList();
      }
      if (filterValues.followersFiltering == followersUnderMillion) {
        list = list
            .where(
              (el) => el.followers < 1000000,
            )
            .toList();
      }
      if (filterValues.countryFiltering != countrySelect) {
        list = list
            .where(
              (el) => el.country.toLowerCase().contains(
                    filterValues.countryFiltering.toLowerCase(),
                  ),
            )
            .toList();
      }
      controller.add(
        list,
      );
    });
  }
}
