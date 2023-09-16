part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class UpdateFiltres extends FilterEvent {
  final String searchText;
  const UpdateFiltres(
    this.searchText,
  );
}

class UpdatePrice extends FilterEvent {
  final String priceSorting;
  const UpdatePrice(
    this.priceSorting,
  );
}

class UpdateTime extends FilterEvent {
  final String timeSorting;
  const UpdateTime(
    this.timeSorting,
  );
}

class UpdateFollowers extends FilterEvent {
  final String followersFiltering;
  const UpdateFollowers(
    this.followersFiltering,
  );
}

class UpdateCountries extends FilterEvent {
  final String countryFiltering;
  const UpdateCountries(
    this.countryFiltering,
  );
}
