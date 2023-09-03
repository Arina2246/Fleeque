part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class Init extends SignInEvent {}

class LoggedIn extends SignInEvent {}

class LoggedOut extends SignInEvent {}

class SubmitSignIn extends SignInEvent {
  final UserEntity user;
  const SubmitSignIn(this.user);
}

class SubmitGoogleSignIn extends SignInEvent {}
