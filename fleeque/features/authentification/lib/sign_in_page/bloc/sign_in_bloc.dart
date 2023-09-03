import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:domain/entities/authentification/authentification_entities.dart';
import 'package:domain/usecases/authentification/error_usecase.dart';
import 'package:domain/usecases/authentification/get_current_uid_usecase.dart';
import 'package:domain/usecases/authentification/is_sign_in_usecase.dart';
import 'package:domain/usecases/authentification/sign_out_usecase.dart';
import 'package:domain/usecases/authentification/sign_in_usecase.dart';
import 'package:domain/usecases/authentification/sign_in_with_google_usecase.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final ErrorAuthentificationUsecase errorAuthentificationUsecase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;
  final SignInUseCase signInUseCase;
  final SignInWithGoogleUsecase signInWithGoogleUsecase;
  SignInBloc({
    required this.errorAuthentificationUsecase,
    required this.getCurrentUidUseCase,
    required this.isSignInUseCase,
    required this.signOutUseCase,
    required this.signInUseCase,
    required this.signInWithGoogleUsecase,
  }) : super(SignInInitial()) {
    on<Init>((event, emit) async {
      emit(Loading());
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
    });
    on<LoggedIn>((event, emit) async {
      emit(Loading());
      try {
        final uid = await getCurrentUidUseCase.call();
        emit(Authenticated(uid: uid));
      } on SocketException catch (_) {
        emit(Unauthenticated());
      }
    });
    on<LoggedOut>((event, emit) async {
      emit(Loading());
      try {
        await signOutUseCase.call();
        emit(Unauthenticated());
      } on SocketException catch (_) {
        emit(Unauthenticated());
      }
    });
    on<SubmitSignIn>((event, emit) async {
      emit(Loading());
      try {
        await signInUseCase.call(event.user);
        emit(Success());
      } on SocketException catch (_) {
        emit(Error(message: _.message));
      } catch (_) {
        errorAuthentificationUsecase.call(_);
        emit(Error(message: _));
      }
    });
    on<SubmitGoogleSignIn>((event, emit) async {
      emit(Loading());
      try {
        await signInWithGoogleUsecase.call();
        emit(Success());
      } on SocketException catch (_) {
        emit(Error(message: _.message));
      } catch (_) {
        errorAuthentificationUsecase.call(_);
        emit(Error(message: _));
      }
    });
  }
}
