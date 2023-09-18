part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserUid extends UserEvent {}

class UpdateName extends UserEvent {}

class ShowName extends UserEvent {}
