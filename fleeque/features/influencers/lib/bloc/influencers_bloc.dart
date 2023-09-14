import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';

import 'package:domain/usecases/influencers/get_influencers_collection_usecase.dart';
import 'package:equatable/equatable.dart';

part 'influencers_event.dart';
part 'influencers_state.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  List<InfluencerEntity> collection = [];

  final GetInfluencersCollectionUsecase getInfluencersCollectionUsecase;
  InfluencersBloc({
    required this.getInfluencersCollectionUsecase,
  }) : super(
          const InfluencersState(
              influencersCollection: [], isLoading: true, isError: false),
        ) {
    on<Init>(
      (event, emit) async {
        await init(emit);
      },
    );
    on<Filter>(
      (event, emit) async {
        await filterData(emit, event.filterData);
      },
    );
  }
  Future<void> init(Emitter emit) async {
    try {
      var influencersCollection = await getInfluencersCollectionUsecase.call();
      emit(
        InfluencersState(
          influencersCollection: influencersCollection,
          isLoading: false,
          isError: false,
        ),
      );
      collection = state.influencersCollection;
    } catch (e) {
      emit(
        const InfluencersState(
          influencersCollection: [],
          isLoading: false,
          isError: true,
        ),
      );
    }
  }

  Future<void> filterData(Emitter emit, Map<String, dynamic> filters) async {
    var collectionCopy = [...collection];
    if (filters['time'] == timeNewest) {
      collectionCopy.sort(
          (a, b) => DateTime.parse(a.time).compareTo(DateTime.parse(b.time)));
    } else if (filters['time'] == timeOldest) {
      collectionCopy.sort(
          (b, a) => DateTime.parse(a.time).compareTo(DateTime.parse(b.time)));
    } else if (filters['price'] == priceLowToHigh) {
      collectionCopy.sort((a, b) => a.basicPrice.compareTo(b.basicPrice));
    } else if (filters['price'] == priceHighToLow) {
      collectionCopy.sort((b, a) => a.basicPrice.compareTo(b.basicPrice));
    }
    if (filters['search'] != '') {
      collectionCopy = collectionCopy
          .where(
            (el) => el.name.toLowerCase().contains(
                  filters['search'].toLowerCase(),
                ),
          )
          .toList();
    }
    if (filters['followers'] == followersOverMillion) {
      collectionCopy = collectionCopy
          .where(
            (el) => el.followers > 999999,
          )
          .toList();
    }
    if (filters['followers'] == followersUnderMillion) {
      collectionCopy = collectionCopy
          .where(
            (el) => el.followers < 1000000,
          )
          .toList();
    }
    if (filters['country'] != countrySelect) {
      collectionCopy = collectionCopy
          .where(
            (el) => el.country.toLowerCase().contains(
                  filters['country'].toLowerCase(),
                ),
          )
          .toList();
    }
    emit(
      InfluencersState(
        influencersCollection: collectionCopy,
        isLoading: false,
        isError: false,
      ),
    );
  }
}
