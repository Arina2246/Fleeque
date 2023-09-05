import 'package:data/providers/influencers/firebase_provider.dart';
import 'package:domain/entities/influencers/influencers_entities.dart';
import 'package:domain/repository/influencers/influencers_repository.dart';

class InfluencersRepositoryImpl extends InfluencersRepository {
  final FirebaseProvider provider;

  InfluencersRepositoryImpl({required this.provider});

  @override
  Future<List<InfluencerEntity>> getInfluencersCollection() async =>
      provider.getInfluencersCollection();

  @override
  Future<String> getDownloadURL(String imgName) async =>
      provider.getDownloadURL(imgName);
}
