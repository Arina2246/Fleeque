part of 'sign_in_bloc.dart';

sealed class SignInEvent {
  const SignInEvent();
}

class Init extends SignInEvent {}

class LoggedIn extends SignInEvent {}

class LoggedOut extends SignInEvent {}

class SubmitSignIn extends SignInEvent {
  final AuthentificationEntity user;
  const SubmitSignIn(this.user);
}

class SubmitGoogleSignIn extends SignInEvent {}
