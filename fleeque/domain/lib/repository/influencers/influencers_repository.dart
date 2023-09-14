import 'package:domain/entities/influencers/influencers_entities.dart';

abstract class InfluencersRepository {
  Future<List<InfluencerEntity>> getInfluencersCollection();
}
