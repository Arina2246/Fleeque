import 'package:domain/repository/authentification/authentification_repository.dart';

class IsSignInUseCase {
  final AuthentificationRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call() async {
    return repository.isSignIn();
  }
}
