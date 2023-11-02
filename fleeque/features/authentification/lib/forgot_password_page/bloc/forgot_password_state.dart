part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final bool success;
  const ForgotPasswordState({
    required this.isLoading,
    required this.isError,
    required this.errorMessage,
    required this.success,
  });

  @override
  List<Object> get props => [isLoading, isError, errorMessage];
}
