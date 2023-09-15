import 'package:bloc/bloc.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:equatable/equatable.dart';
import 'package:domain/usecases/influencers/get_influencers_collection_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetInfluencersCollectionUsecase getInfluencersCollectionUsecase;
  HomeBloc({
    required this.getInfluencersCollectionUsecase,
  }) : super(
          const HomeState(
              influencersCollection: [], isLoading: true, isError: false),
        ) {
    on<Init>(
      (event, emit) async {
        await init(emit);
      },
    );
  }

  Future<void> init(Emitter emit) async {
    await emit.forEach(
      getInfluencersCollectionUsecase.call(),
      onData: (List<InfluencerEntity> influencersCollection) {
        return HomeState(
          influencersCollection: influencersCollection,
          isLoading: false,
          isError: false,
        );
      },
      onError: (error, stackTrace) => const HomeState(
        influencersCollection: [],
        isLoading: false,
        isError: true,
      ),
    );
  }
}
