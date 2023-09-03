part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class Authenticated extends SignInState {
  final String uid;
  const Authenticated({required this.uid});
}

final class Unauthenticated extends SignInState {}

final class Loading extends SignInState {}

final class Success extends SignInState {}

final class Error extends SignInState {
  final Object message;
  const Error({required this.message});
}
