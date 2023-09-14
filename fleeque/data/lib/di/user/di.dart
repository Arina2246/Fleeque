import 'package:data/data_souces/hive/authentification/user_hive_service.dart';
import 'package:data/repository_impl/user/user_repository_impl.dart';
import 'package:domain/repository/user/user_repository.dart';
import 'package:domain/usecases/user/delete_user_data_usecase.dart';
import 'package:domain/usecases/user/get_user_data_usecase.dart';
import 'package:domain/usecases/user/put_user_data_usecase.dart';
import '../di.dart';

Future<void> userDI() async {
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      hiveService: sl.call(),
    ),
  );

  sl.registerLazySingleton<UserHiveService>(
    () => UserHiveService(
      box: sl.call(),
    ),
  );

  sl.registerLazySingleton<GetUserDataUseCase>(
    () => GetUserDataUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<PutUserDataUseCase>(
    () => PutUserDataUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<DeleteUserDataUseCase>(
    () => DeleteUserDataUseCase(
      repository: sl.call(),
    ),
  );
}
