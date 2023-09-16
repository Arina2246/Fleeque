import 'package:bloc/bloc.dart';
import 'package:domain/usecases/influencers/filter_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:domain/entities/filter/filter_entities.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  final FilterInfluencersCollectionUsecase filterInfluencersCollectionUsecase;
  FilterBloc({
    required this.filterInfluencersCollectionUsecase,
  }) : super(const FilterState(
            priceSorting: 'Select',
            timeSorting: 'Select',
            followersFiltering: 'Select',
            countryFiltering: 'Select',
            searchText: '')) {
    on<UpdateFiltres>((event, emit) {
      updateFiltres(emit: emit, searchText: event.searchText);
    });
    on<UpdatePrice>((event, emit) {
      updatePrice(emit: emit, priceSorting: event.priceSorting);
    });
    on<UpdateTime>((event, emit) {
      updateTime(emit: emit, timeSorting: event.timeSorting);
    });
    on<UpdateFollowers>((event, emit) {
      updateFollowers(emit: emit, followersFiltering: event.followersFiltering);
    });
    on<UpdateCountries>((event, emit) {
      updateCountries(emit: emit, countryFiltering: event.countryFiltering);
    });
  }
  void updateFiltres({required Emitter emit, required String searchText}) {
    filterInfluencersCollectionUsecase.call(
      FilterEntity(
          priceSorting: state.priceSorting,
          timeSorting: state.timeSorting,
          followersFiltering: state.followersFiltering,
          countryFiltering: state.countryFiltering,
          searchText: searchText),
    );
  }

  void updatePrice({required Emitter emit, required String priceSorting}) {
    if (priceSorting != 'Select') {
      emit(state.copyWith(timeSorting: 'Select'));
    }
    emit(state.copyWith(priceSorting: priceSorting));
  }

  void updateTime({required Emitter emit, required String timeSorting}) {
    if (timeSorting != 'Select') {
      emit(state.copyWith(priceSorting: 'Select'));
    }
    emit(state.copyWith(timeSorting: timeSorting));
  }

  void updateFollowers(
      {required Emitter emit, required String followersFiltering}) {
    emit(state.copyWith(followersFiltering: followersFiltering));
  }

  void updateCountries(
      {required Emitter emit, required String countryFiltering}) {
    emit(state.copyWith(countryFiltering: countryFiltering));
  }

  void updateSearch({required Emitter emit, required String searchText}) {
    emit(state.copyWith(searchText: searchText));
  }
}
