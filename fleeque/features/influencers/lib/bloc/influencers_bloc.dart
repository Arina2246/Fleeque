import 'package:bloc/bloc.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:domain/usecases/influencers/get_download_url_usecase.dart';
import 'package:domain/usecases/influencers/get_influencers_collection_usecase.dart';
import 'package:equatable/equatable.dart';

part 'influencers_event.dart';
part 'influencers_state.dart';

class InfluencersBloc extends Bloc<InfluencersEvent, InfluencersState> {
  final GetDownloadUrlUsecase getDownloadUrlUsecase;
  final GetInfluencersCollectionUsecase getInfluencersCollectionUsecase;
  InfluencersBloc({
    required this.getDownloadUrlUsecase,
    required this.getInfluencersCollectionUsecase,
  }) : super(
          InfluencersInitial(),
        ) {
    on<Init>(
      (event, emit) async {
        emit(
          Loading(),
        );
        try {
          final influencersCollection =
              await getInfluencersCollectionUsecase.call();
          emit(
            Success(influencersCollection: influencersCollection),
          );
        } catch (e) {
          emit(
            Error(),
          );
        }
      },
    );
  }
}
