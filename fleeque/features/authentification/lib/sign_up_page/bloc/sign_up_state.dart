part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final String uid;
  final bool isAuthenticated;
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  const SignUpState({
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
