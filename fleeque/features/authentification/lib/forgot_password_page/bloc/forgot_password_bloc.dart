import 'package:bloc/bloc.dart';
import 'package:domain/usecases/authentification/error_usecase.dart';
import 'package:domain/usecases/authentification/forgot_password_usecase.dart';
import 'package:equatable/equatable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUsecase forgotPasswordUsecase;
  final ErrorAuthentificationUsecase errorAuthentificationUsecase;

  ForgotPasswordBloc(
      {required this.forgotPasswordUsecase,
      required this.errorAuthentificationUsecase})
      : super(
          const ForgotPasswordState(
              isLoading: false,
              isError: false,
              errorMessage: '',
              success: false),
        ) {
    on<SubmitForgotPassword>((event, emit) async {
      await submitForgotPassword(emit: emit, email: event.email);
    });
  }

  Future<void> submitForgotPassword(
      {required Emitter emit, required String email}) async {
    emit(
      const ForgotPasswordState(
          isLoading: true, isError: false, errorMessage: '', success: false),
    );
    try {
      await forgotPasswordUsecase.call(email);
      emit(
        const ForgotPasswordState(
            isLoading: false, isError: false, errorMessage: '', success: true),
      );
    } catch (_) {
      var error = errorAuthentificationUsecase.call(_);
      emit(
        ForgotPasswordState(
            isLoading: false,
            isError: true,
            errorMessage: error,
            success: false),
      );
    }
  }
}
