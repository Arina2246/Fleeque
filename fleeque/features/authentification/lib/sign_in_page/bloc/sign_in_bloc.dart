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
  }) : super(
          const SignInState(
              uid: '',
              isAuthenticated: false,
              isLoading: true,
              isError: false,
              errorMessage: ''),
        ) {
    on<Init>(
      (event, emit) async {
        await init(emit);
      },
    );
    on<LoggedOut>(
      (event, emit) async {
        await loggedOut(emit);
      },
    );
    on<SubmitSignIn>(
      (event, emit) async {
        await submitSignIn(emit: emit, user: event.user);
      },
    );
    on<SubmitGoogleSignIn>(
      (event, emit) async {
        await signInWithGoogle(emit);
      },
    );
  }

  Future<void> init(Emitter emit) async {
    try {
      var isSignIn = await isSignInUseCase.call();
      emit(
        const SignInState(
            uid: '',
            isAuthenticated: false,
            isError: false,
            isLoading: false,
            errorMessage: ''),
      );
      if (isSignIn) {
        final uid = await getCurrentUidUseCase.call();
        emit(
          SignInState(
              uid: uid,
              isAuthenticated: true,
              isError: false,
              isLoading: false,
              errorMessage: ''),
        );
      } else {
        emit(
          const SignInState(
              uid: '',
              isAuthenticated: false,
              isError: false,
              isLoading: false,
              errorMessage: ''),
        );
      }
    } catch (_) {
      emit(
        const SignInState(
            uid: '',
            isAuthenticated: false,
            isError: false,
            isLoading: false,
            errorMessage: ''),
      );
    }
  }

  Future<void> loggedOut(Emitter emit) async {
    try {
      await signOutUseCase.call();
      emit(
        const SignInState(
            uid: '',
            isAuthenticated: false,
            isError: false,
            isLoading: false,
            errorMessage: ''),
      );
    } catch (_) {
      emit(
        const SignInState(
            uid: '',
            isAuthenticated: false,
            isError: false,
            isLoading: false,
            errorMessage: ''),
      );
    }
  }

  Future<void> submitSignIn(
      {required Emitter emit, required UserEntity user}) async {
    emit(
      const SignInState(
          uid: '',
          isAuthenticated: false,
          isError: false,
          isLoading: true,
          errorMessage: ''),
    );
    try {
      await signInUseCase.call(user);
      final uid = await getCurrentUidUseCase.call();
      emit(
        SignInState(
            uid: uid,
            isAuthenticated: true,
            isError: false,
            isLoading: false,
            errorMessage: ''),
      );
    } catch (_) {
      final errorMessage = errorAuthentificationUsecase.call(_);
      emit(
        SignInState(
            uid: '',
            isAuthenticated: false,
            isError: true,
            isLoading: false,
            errorMessage: errorMessage),
      );
    }
  }

  Future<void> signInWithGoogle(Emitter emit) async {
    try {
      await signInWithGoogleUsecase.call();
      final uid = await getCurrentUidUseCase.call();
      emit(
        SignInState(
            uid: uid,
            isAuthenticated: true,
            isError: false,
            isLoading: false,
            errorMessage: ''),
      );
    } catch (_) {
      final errorMessage = errorAuthentificationUsecase.call(_);
      emit(
        SignInState(
            uid: '',
            isAuthenticated: false,
            isError: true,
            isLoading: false,
            errorMessage: errorMessage),
      );
    }
  }
}
