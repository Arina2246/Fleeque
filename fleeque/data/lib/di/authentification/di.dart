// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:data/providers/authentification/firebase_provider.dart';
// import 'package:data/repository_impl/authentification/authentification_repository_impl.dart';
// import 'package:domain/repository/authentification/authentification_repository.dart';
// import 'package:domain/usecases/authentification/forgot_password_usecase.dart';
// import 'package:domain/usecases/authentification/get_current_uid_usecase.dart';
// import 'package:domain/usecases/authentification/is_sign_in_usecase.dart';
// import 'package:domain/usecases/authentification/sign_in_with_google_usecase.dart';
// import 'package:domain/usecases/authentification/sign_in_usecase.dart';
// import 'package:domain/usecases/authentification/sign_out_usecase.dart';
// import 'package:domain/usecases/authentification/sign_up_usecase.dart';
// import 'package:domain/usecases/authentification/error_usecase.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get_it/get_it.dart';

// GetIt sl = GetIt.I;

// Future<void> init() async {
//   final auth = FirebaseAuth.instance;
//   final fireStore = FirebaseFirestore.instance;
//   sl.registerLazySingleton(() => auth);
//   sl.registerLazySingleton(() => fireStore);

//   sl.registerLazySingleton<AuthentificationRepository>(
//     () => AuthentificationRepositoryImpl(
//       provider: sl.call(),
//     ),
//   );
//   sl.registerLazySingleton<FirebaseProvider>(
//     () => FirebaseProvider(
//       auth: sl.call(),
//       firestore: sl.call(),
//     ),
//   );

//   sl.registerLazySingleton<SignInUseCase>(
//     () => SignInUseCase(
//       repository: sl.call(),
//     ),
//   );
//   sl.registerLazySingleton<SignOutUseCase>(
//     () => SignOutUseCase(
//       repository: sl.call(),
//     ),
//   );
//   sl.registerLazySingleton<SignUpUseCase>(
//     () => SignUpUseCase(
//       repository: sl.call(),
//     ),
//   );
//   sl.registerLazySingleton<GetCurrentUidUseCase>(
//     () => GetCurrentUidUseCase(
//       repository: sl.call(),
//     ),
//   );
//   sl.registerLazySingleton<IsSignInUseCase>(
//     () => IsSignInUseCase(
//       repository: sl.call(),
//     ),
//   );
//   sl.registerLazySingleton<ErrorAuthentificationUsecase>(
//     () => ErrorAuthentificationUsecase(
//       repository: sl.call(),
//     ),
//   );
//   sl.registerLazySingleton<ForgotPasswordUsecase>(
//     () => ForgotPasswordUsecase(
//       repository: sl.call(),
//     ),
//   );
//   sl.registerLazySingleton<SignInWithGoogleUsecase>(
//     () => SignInWithGoogleUsecase(
//       repository: sl.call(),
//     ),
//   );
// }
import 'package:data/providers/authentification/firebase_provider.dart';
import 'package:data/repository_impl/authentification/authentification_repository_impl.dart';
import 'package:domain/repository/authentification/authentification_repository.dart';
import 'package:domain/usecases/authentification/forgot_password_usecase.dart';
import 'package:domain/usecases/authentification/get_current_uid_usecase.dart';
import 'package:domain/usecases/authentification/is_sign_in_usecase.dart';
import 'package:domain/usecases/authentification/sign_in_with_google_usecase.dart';
import 'package:domain/usecases/authentification/sign_in_usecase.dart';
import 'package:domain/usecases/authentification/sign_out_usecase.dart';
import 'package:domain/usecases/authentification/sign_up_usecase.dart';
import 'package:domain/usecases/authentification/error_usecase.dart';
import '../di.dart';

Future<void> authentificationDI() async {
  sl.registerLazySingleton<AuthentificationRepository>(
    () => AuthentificationRepositoryImpl(
      provider: sl.call(),
    ),
  );
  sl.registerLazySingleton<FirebaseProvider>(
    () => FirebaseProvider(
      auth: sl.call(),
      firestore: sl.call(),
    ),
  );

  sl.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<GetCurrentUidUseCase>(
    () => GetCurrentUidUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<IsSignInUseCase>(
    () => IsSignInUseCase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<ErrorAuthentificationUsecase>(
    () => ErrorAuthentificationUsecase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<ForgotPasswordUsecase>(
    () => ForgotPasswordUsecase(
      repository: sl.call(),
    ),
  );
  sl.registerLazySingleton<SignInWithGoogleUsecase>(
    () => SignInWithGoogleUsecase(
      repository: sl.call(),
    ),
  );
}
