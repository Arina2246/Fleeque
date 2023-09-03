part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class SubmitForgotPassword extends ForgotPasswordEvent {
  final String email;
  const SubmitForgotPassword(this.email);
}
