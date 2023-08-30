import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:domain/entities/login/login_entities.dart';
import 'package:domain/usecases/login/get_create_current_user_usecase.dart';
import 'package:domain/usecases/login/get_current_UId_usecase.dart';
import 'package:domain/usecases/login/is_sign_in_usecase.dart';
import 'package:domain/usecases/login/sign_in_usecase.dart';
import 'package:domain/usecases/login/sign_out_useccase.dart';
import 'package:domain/usecases/login/sign_up_usecase.dart';
import 'package:domain/usecases/login/error_login_usecase.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ErrorLoginUsecase errorLoginUsecase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUPUseCase;
  final GetCreateCurrentUserUsecase getCreateCurrentUserUseCase;

  LoginBloc({
    required this.errorLoginUsecase,
    required this.getCurrentUidUseCase,
    required this.isSignInUseCase,
    required this.signOutUseCase,
    required this.signInUseCase,
    required this.signUPUseCase,
    required this.getCreateCurrentUserUseCase,
  }) : super(LoginInitial());

  Future<void> init() async {
    try {
      final isSignIn = await isSignInUseCase.call();
      if (isSignIn) {
        final uid = await getCurrentUidUseCase.call();
        emit(Authenticated(uid: uid));
      } else {
        emit(Unauthenticated());
      }
    } on SocketException catch (_) {
      emit(Unauthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUidUseCase.call();
      emit(Authenticated(uid: uid));
    } on SocketException catch (_) {
      emit(Unauthenticated());
    }
  }

  Future<void> loggedOut() async {
    print('logged out');
    try {
      await signOutUseCase.call();
      emit(Unauthenticated());
    } on SocketException catch (_) {
      emit(Unauthenticated());
    }
  }

  Future<void> submitSignIn({required UserEntity user}) async {
    emit(Loading());
    try {
      await signInUseCase.call(user);
      emit(Success());
    } on SocketException catch (_) {
      emit(ErrorLogin(message: _.message));
    } catch (_) {
      errorLoginUsecase.call(_);
      emit(ErrorLogin(message: _));
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(Loading());
    try {
      await signUPUseCase.call(user);
      await getCreateCurrentUserUseCase.call(user);
      emit(Success());
    } on SocketException catch (_) {
      emit(ErrorLogin(message: _.message));
    } catch (_) {
      emit(ErrorLogin(message: _));
    }
  }
}
