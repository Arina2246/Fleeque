import 'package:domain/repository/authentification/authentification_repository.dart';

class ForgotPasswordUsecase {
  final AuthentificationRepository repository;

  ForgotPasswordUsecase({required this.repository});

  Future<void> call(String email) {
    return repository.forgotPassword(email);
  }
}
