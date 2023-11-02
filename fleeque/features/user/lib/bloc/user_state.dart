part of 'user_bloc.dart';

class UserState extends Equatable {
  final bool isLoading;
  final UserEntity? userData;
  const UserState({required this.isLoading, required this.userData});

  @override
  List<Object> get props => [
        isLoading,
      ];
}
