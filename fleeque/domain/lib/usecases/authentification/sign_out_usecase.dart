import 'package:domain/repository/authentification/authentification_repository.dart';

class SignOutUseCase {
  final AuthentificationRepository repository;

  SignOutUseCase({required this.repository});

  Future<void> call() async {
    return repository.signOut();
  }
}
