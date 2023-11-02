part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final String uid;
  final bool isAuthenticated;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  const SignInState({
    required this.uid,
    required this.isAuthenticated,
    required this.isLoading,
    required this.isError,
    required this.errorMessage,
  });

  @override
  List<Object> get props =>
      [uid, isAuthenticated, isLoading, isError, errorMessage];
}
