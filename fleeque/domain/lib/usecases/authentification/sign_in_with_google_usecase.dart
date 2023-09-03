import 'package:domain/repository/authentification/authentification_repository.dart';

class SignInWithGoogleUsecase {
  final AuthentificationRepository repository;

  SignInWithGoogleUsecase({required this.repository});

  Future<void> call() {
    return repository.signInWithGoogle();
  }
}
