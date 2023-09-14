part of 'sign_up_bloc.dart';

sealed class SignUpEvent {
  const SignUpEvent();
}

class LoggedIn extends SignUpEvent {}

class LoggedOut extends SignUpEvent {}

class SubmitSignUp extends SignUpEvent {
  final AuthentificationEntity user;
  const SubmitSignUp(this.user);
}

class SubmitSignUpGoogle extends SignUpEvent {}
