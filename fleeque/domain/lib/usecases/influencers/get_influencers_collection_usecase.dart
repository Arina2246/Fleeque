import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:domain/repository/influencers/influencers_repository.dart';

class GetInfluencersCollectionUsecase {
  final InfluencersRepository repository;

  GetInfluencersCollectionUsecase({required this.repository});

  Stream<List<InfluencerEntity>> call() {
    return repository.getInfluencersCollection();
  }
}
