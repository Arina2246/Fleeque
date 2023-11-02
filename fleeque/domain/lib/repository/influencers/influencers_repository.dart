import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:domain/entities/filter/filter_entities.dart';

abstract class InfluencersRepository {
  Stream<List<InfluencerEntity>> getInfluencersCollection();
  void filterInfluencersCollection(FilterEntity filterValues);
}
