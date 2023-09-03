import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:domain/entities/authentification/authentification_entities.dart';
import 'package:domain/usecases/authentification/error_usecase.dart';
import 'package:domain/usecases/authentification/get_current_uid_usecase.dart';
import 'package:domain/usecases/authentification/is_sign_in_usecase.dart';
import 'package:domain/usecases/authentification/sign_in_with_google_usecase.dart';
import 'package:domain/usecases/authentification/sign_out_usecase.dart';
import 'package:domain/usecases/authentification/sign_up_usecase.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final ErrorAuthentificationUsecase errorAuthentificationUsecase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;
  final SignUpUseCase signUpUseCase;
  final SignInWithGoogleUsecase signInWithGoogleUsecase;
  SignUpBloc({
    required this.errorAuthentificationUsecase,
    required this.getCurrentUidUseCase,
    required this.signUpUseCase,
    required this.isSignInUseCase,
    required this.signOutUseCase,
    required this.signInWithGoogleUsecase,
  }) : super(SignUpInitial()) {
    on<Init>((event, emit) async {
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
    on<SubmitSignUp>((event, emit) async {
      emit(Loading());
      try {
        await signUpUseCase.call(event.user);
        emit(Success());
      } on SocketException catch (_) {
        emit(Error(message: _.message));
      } catch (_) {
        errorAuthentificationUsecase.call(_);
        emit(Error(message: _));
      }
    });
    on<SubmitSignUpGoogle>((event, emit) async {
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
