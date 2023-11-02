import 'package:domain/entities/authentification/authentification_entities.dart';
import 'package:domain/repository/authentification/authentification_repository.dart';

class SignUpUseCase {
  final AuthentificationRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(AuthentificationEntity user) async {
    return repository.signUp(user);
  }
}
