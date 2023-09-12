import 'package:bloc/bloc.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:equatable/equatable.dart';

import 'package:domain/usecases/influencers/get_download_url_usecase.dart';
import 'package:domain/usecases/influencers/get_influencers_collection_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetDownloadUrlUsecase getDownloadUrlUsecase;
  final GetInfluencersCollectionUsecase getInfluencersCollectionUsecase;
  HomeBloc({
    required this.getDownloadUrlUsecase,
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
    try {
      var influencersCollection = await getInfluencersCollectionUsecase.call();
      emit(
        HomeState(
          influencersCollection: influencersCollection,
          isLoading: false,
          isError: false,
        ),
      );
    } catch (e) {
      emit(
        const HomeState(
          influencersCollection: [],
          isLoading: false,
          isError: true,
        ),
      );
    }
  }
}
