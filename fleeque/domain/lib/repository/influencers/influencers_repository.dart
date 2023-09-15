import 'package:domain/entities/influencers/influencers_entities.dart';

abstract class InfluencersRepository {
  Stream<List<InfluencerEntity>> getInfluencersCollection();
}
