part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class Authenticated extends SignUpState {
  final String uid;
  const Authenticated({required this.uid});
}

final class Unauthenticated extends SignUpState {}

final class Loading extends SignUpState {}

final class Success extends SignUpState {}

final class Error extends SignUpState {
  final Object message;
  const Error({required this.message});
}
