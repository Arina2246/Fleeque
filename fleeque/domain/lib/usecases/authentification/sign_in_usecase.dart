import 'package:domain/entities/authentification/authentification_entities.dart';
import 'package:domain/repository/authentification/authentification_repository.dart';

class SignInUseCase {
  final AuthentificationRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.signIn(user);
  }
}
