import 'package:bloc/bloc.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';

import 'package:domain/usecases/influencers/get_influencers_collection_usecase.dart';
import 'package:equatable/equatable.dart';

part 'influencers_event.dart';
part 'influencers_state.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  final GetInfluencersCollectionUsecase getInfluencersCollectionUsecase;
  InfluencersBloc({
    required this.getInfluencersCollectionUsecase,
  }) : super(
          const InfluencersState(
            influencersCollection: [],
            isLoading: true,
            isError: false,
          ),
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
        return InfluencersState(
          influencersCollection: influencersCollection,
          isLoading: false,
          isError: false,
        );
      },
      onError: (error, stackTrace) => const InfluencersState(
        influencersCollection: [],
        isLoading: false,
        isError: true,
      ),
    );
  }
}
