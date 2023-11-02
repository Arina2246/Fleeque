part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

class SubmitForgotPassword extends ForgotPasswordEvent {
  final String email;
  const SubmitForgotPassword(this.email);
}
