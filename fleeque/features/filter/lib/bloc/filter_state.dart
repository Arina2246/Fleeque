part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final String priceSorting;
  final String timeSorting;
  final String followersFiltering;
  final String countryFiltering;
  final String searchText;
  const FilterState(
      {required this.priceSorting,
      required this.timeSorting,
      required this.followersFiltering,
      required this.countryFiltering,
      required this.searchText});

  FilterState copyWith({
    String? priceSorting,
    String? timeSorting,
    String? followersFiltering,
    String? countryFiltering,
    String? searchText,
  }) {
    return FilterState(
      priceSorting: priceSorting ?? this.priceSorting,
      timeSorting: timeSorting ?? this.timeSorting,
      followersFiltering: followersFiltering ?? this.followersFiltering,
      countryFiltering: countryFiltering ?? this.countryFiltering,
      searchText: searchText ?? this.searchText,
    );
  }

  @override
  List<Object> get props => [
        priceSorting,
        timeSorting,
        followersFiltering,
        countryFiltering,
        searchText
      ];
}
