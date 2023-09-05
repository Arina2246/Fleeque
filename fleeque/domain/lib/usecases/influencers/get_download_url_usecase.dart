import 'package:domain/repository/influencers/influencers_repository.dart';

class GetDownloadUrlUsecase {
  final InfluencersRepository repository;

  GetDownloadUrlUsecase({required this.repository});

  Future<String> call(String imgName) async {
    return repository.getDownloadURL(imgName);
  }
}
