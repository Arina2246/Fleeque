part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class Authenticated extends LoginState {
  final String uid;
  const Authenticated({required this.uid});
}

final class Unauthenticated extends LoginState {}

final class Loading extends LoginState {}

final class Success extends LoginState {}

final class ErrorLogin extends LoginState {
  final Object message;
  const ErrorLogin({required this.message});
}
