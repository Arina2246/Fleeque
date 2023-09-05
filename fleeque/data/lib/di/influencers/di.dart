import 'package:data/providers/influencers/firebase_provider.dart';
import 'package:data/repository_impl/influencers/influencers_repository_impl.dart';
import 'package:domain/repository/influencers/influencers_repository.dart';
import 'package:domain/usecases/influencers/get_download_url_usecase.dart';
import 'package:domain/usecases/influencers/get_influencers_collection_usecase.dart';
import '../di.dart';

Future<void> influencersDI() async {
  sl.registerLazySingleton<InfluencersRepository>(
    () => InfluencersRepositoryImpl(
      provider: sl.call(),
    ),
  );
  sl.registerLazySingleton<FirebaseProvider>(
    () => FirebaseProvider(
      firestore: sl.call(),
      storage: sl.call(),
    ),
  );

  sl.registerLazySingleton<GetDownloadUrlUsecase>(
    () => GetDownloadUrlUsecase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetInfluencersCollectionUsecase>(
    () => GetInfluencersCollectionUsecase(
      repository: sl.call(),
    ),
  );
}
