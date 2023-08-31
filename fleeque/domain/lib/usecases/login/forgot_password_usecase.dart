import 'package:domain/repository/login/login_repository.dart';

class ForgotPasswordUsecase {
  final LoginRepository repository;

  ForgotPasswordUsecase({required this.repository});

  Future<void> call(String email) {
    return repository.forgotPassword(email);
  }
}
