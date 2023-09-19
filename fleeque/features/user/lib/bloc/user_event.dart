part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserData extends UserEvent {}

class LogOut extends UserEvent {}

class UpdateUserData extends UserEvent {
  final String name;
  final String email;
  final String number;
  final String insta;
  final String bankAccount;
  const UpdateUserData(
      {required this.bankAccount,
      required this.email,
      required this.insta,
      required this.name,
      required this.number});
}
