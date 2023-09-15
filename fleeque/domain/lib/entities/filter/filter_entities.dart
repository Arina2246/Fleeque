import 'package:equatable/equatable.dart';

class FilterEntity extends Equatable {
  final String priceSorting;
  final String timeSorting;
  final String followersFiltering;
  final String countryFiltering;
  final String searchText;

  const FilterEntity({
    required this.priceSorting,
    required this.timeSorting,
    required this.followersFiltering,
    required this.countryFiltering,
    required this.searchText,
  });

  @override
  List<Object?> get props => [
        priceSorting,
        timeSorting,
        followersFiltering,
        countryFiltering,
        searchText,
      ];
}
