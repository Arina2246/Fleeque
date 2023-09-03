part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class Loading extends ForgotPasswordState {}

final class Success extends ForgotPasswordState {}

final class Error extends ForgotPasswordState {
  final Object message;
  const Error({required this.message});
}
