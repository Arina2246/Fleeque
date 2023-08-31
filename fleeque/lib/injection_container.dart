import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/data_souces/login/login_service.dart';
import 'package:data/data_souces/login/login_service_impl.dart';
import 'package:data/repository_impl/login/login_repository_impl.dart';
import 'package:domain/repository/login/login_repository.dart';
import 'package:domain/usecases/login/forgot_password_usecase.dart';
import 'package:domain/usecases/login/get_create_current_user_usecase.dart';
import 'package:domain/usecases/login/get_current_UId_usecase.dart';
import 'package:domain/usecases/login/is_sign_in_usecase.dart';
import 'package:domain/usecases/login/sign_in_with_google_usecase.dart';
import 'package:domain/usecases/login/sign_in_usecase.dart';
import 'package:domain/usecases/login/sign_out_useccase.dart';
import 'package:domain/usecases/login/sign_up_usecase.dart';
import 'package:domain/usecases/login/error_login_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:login/bloc/login_bloc.dart';

GetIt getIt = GetIt.I;

Future<void> init() async {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      errorLoginUsecase: getIt.call(),
      getCurrentUidUseCase: getIt.call(),
      isSignInUseCase: getIt.call(),
      signOutUseCase: getIt.call(),
      signInUseCase: getIt.call(),
      signUpUseCase: getIt.call(),
      getCreateCurrentUserUseCase: getIt.call(),
      forgotPasswordUseCase: getIt.call(),
      signInWithGoogleUsecase: getIt.call(),
    ),
  );

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  getIt.registerLazySingleton(() => auth);
  getIt.registerLazySingleton(() => fireStore);

  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      dataSource: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<LoginService>(
    () => LoginServiceImpl(
      auth: getIt.call(),
      firestore: getIt.call(),
    ),
  );

  getIt.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(
      repository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<SignOutUseCase>(
    () => SignOutUseCase(
      repository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(
      repository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<GetCreateCurrentUserUsecase>(
    () => GetCreateCurrentUserUsecase(
      repository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<GetCurrentUidUseCase>(
    () => GetCurrentUidUseCase(
      repository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<IsSignInUseCase>(
    () => IsSignInUseCase(
      repository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<ErrorLoginUsecase>(
    () => ErrorLoginUsecase(
      repository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<ForgotPasswordUsecase>(
    () => ForgotPasswordUsecase(
      repository: getIt.call(),
    ),
  );
  getIt.registerLazySingleton<SignInWithGoogleUsecase>(
    () => SignInWithGoogleUsecase(
      repository: getIt.call(),
    ),
  );
}
