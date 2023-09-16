import 'package:data/providers/influencers/firebase_provider.dart';
import 'package:domain/entities/filter/filter_entities.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:domain/repository/influencers/influencers_repository.dart';

class InfluencersRepositoryImpl extends InfluencersRepository {
  final FirebaseProvider provider;

  InfluencersRepositoryImpl({required this.provider});

  @override
  Stream<List<InfluencerEntity>> getInfluencersCollection() =>
      provider.getInfluencersCollection();
  @override
  void filterInfluencersCollection(FilterEntity filterValues) =>
      provider.filterInfluencersCollection(filterValues);
}
