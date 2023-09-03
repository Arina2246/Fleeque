part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class Init extends SignUpEvent {}

class LoggedIn extends SignUpEvent {}

class LoggedOut extends SignUpEvent {}

class SubmitSignUp extends SignUpEvent {
  final UserEntity user;
  const SubmitSignUp(this.user);
}

class SubmitSignUpGoogle extends SignUpEvent {}
