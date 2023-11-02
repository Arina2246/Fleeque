import 'package:data/data_souces/hive/authentification/user_hive_service.dart';
import 'package:data/repository_impl/user/user_repository_impl.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:domain/usecases/user/delete_user_uid_usecase.dart';
import 'package:domain/usecases/user/get_user_data_usecase.dart';
import 'package:domain/usecases/user/get_user_uid_usecase.dart';
import 'package:domain/usecases/user/put_user_uid_usecase.dart';
import 'package:domain/usecases/user/update_user_data_usecase.dart';
import 'package:domain/usecases/user/update_user_img_usecase.dart';
import 'package:data/providers/user/firebase_provider.dart';
import '../di.dart';

Future<void> userDI() async {
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      hiveService: sl.call(),
      provider: sl.call(),
    ),
  );

  sl.registerLazySingleton<UserHiveService>(
    () => UserHiveService(
      box: sl.call(),
    ),
  );
  sl.registerLazySingleton<FirebaseProvider>(
    () => FirebaseProvider(
      firestore: sl.call(),
      storage: sl.call(),
    ),
  );

  sl.registerLazySingleton<GetUserUidUseCase>(
    () => GetUserUidUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<PutUserUidUseCase>(
    () => PutUserUidUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<DeleteUserUidUseCase>(
    () => DeleteUserUidUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetUserDataUseCase>(
    () => GetUserDataUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<UpdateUserDataUseCase>(
    () => UpdateUserDataUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<UpdateUserImgUseCase>(
    () => UpdateUserImgUseCase(
      repository: sl.call(),
    ),
  );
}
