import 'package:domain/entities/filter/filter_entities.dart';
import 'package:domain/repository/influencers/influencers_repository.dart';

class FilterInfluencersCollectionUsecase {
  final InfluencersRepository repository;

  FilterInfluencersCollectionUsecase({required this.repository});

  void call(FilterEntity filterValues) {
    return repository.filterInfluencersCollection(filterValues);
  }
}
