import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:domain/usecases/influencers/get_download_url_usecase.dart';
import 'package:domain/usecases/influencers/get_influencers_collection_usecase.dart';
import 'package:equatable/equatable.dart';

part 'influencers_event.dart';
part 'influencers_state.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  List<InfluencerEntity> collection = [];
  final GetDownloadUrlUsecase getDownloadUrlUsecase;
  final GetInfluencersCollectionUsecase getInfluencersCollectionUsecase;
  InfluencersBloc({
    required this.getDownloadUrlUsecase,
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
    emit(
      InfluencersState(
        influencersCollection: collectionCopy,
        isLoading: false,
        isError: false,
      ),
    );
  }
}
