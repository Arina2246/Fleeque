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
  }) : super(
          const SignUpState(
              uid: '',
              isAuthenticated: false,
              isError: false,
              isLoading: false,
              errorMessage: ''),
        ) {
    on<LoggedOut>(
      (event, emit) async {
        await loggedOut(emit);
      },
    );
    on<SubmitSignUp>(
      (event, emit) async {
        await submitSignUp(emit: emit, user: event.user);
      },
    );
    on<SubmitSignUpGoogle>(
      (event, emit) async {
        await signInWithGoogle(emit);
      },
    );
  }

  Future<void> loggedOut(Emitter emit) async {
    try {
      await signOutUseCase.call();
      emit(
        const SignUpState(
            uid: '',
            isAuthenticated: false,
            isError: false,
            isLoading: false,
            errorMessage: ''),
      );
    } catch (_) {
      emit(
        const SignUpState(
            uid: '',
            isAuthenticated: false,
            isError: false,
            isLoading: false,
            errorMessage: ''),
      );
    }
  }

  Future<void> submitSignUp(
      {required Emitter emit, required UserEntity user}) async {
    emit(
      const SignUpState(
          uid: '',
          isAuthenticated: false,
          isError: false,
          isLoading: true,
          errorMessage: ''),
    );
    try {
      await signUpUseCase.call(user);
      final uid = await getCurrentUidUseCase.call();
      emit(
        SignUpState(
            uid: uid,
            isAuthenticated: true,
            isError: false,
            isLoading: false,
            errorMessage: ''),
      );
    } catch (_) {
      final errorMessage = errorAuthentificationUsecase.call(_);
      emit(
        SignUpState(
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
        SignUpState(
            uid: uid,
            isAuthenticated: true,
            isError: false,
            isLoading: false,
            errorMessage: ''),
      );
    } catch (_) {
      final errorMessage = errorAuthentificationUsecase.call(_);
      emit(
        SignUpState(
            uid: '',
            isAuthenticated: false,
            isError: true,
            isLoading: false,
            errorMessage: errorMessage),
      );
    }
  }
}
