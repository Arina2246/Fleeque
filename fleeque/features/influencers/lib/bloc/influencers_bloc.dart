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
            influencersStream: null,
          ),
        ) {
    on<Init>(
      (event, emit) async {
        await init(emit);
      },
    );
  }

  Future<void> init(Emitter emit) async {
    var influencersStream = getInfluencersCollectionUsecase.call();
    emit(InfluencersState(
      influencersStream: influencersStream,
    ));
  }
}
