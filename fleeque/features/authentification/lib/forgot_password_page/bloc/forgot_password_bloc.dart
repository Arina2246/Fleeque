import 'dart:io';

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
      : super(ForgotPasswordInitial()) {
    on<SubmitForgotPassword>((event, emit) async {
      emit(Loading());

      try {
        await forgotPasswordUsecase.call(event.email);
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
