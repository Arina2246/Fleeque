import 'package:domain/repository/authentification/authentification_repository.dart';

class ErrorAuthentificationUsecase {
  final AuthentificationRepository repository;

  ErrorAuthentificationUsecase({required this.repository});

  String call(Object error) {
    return repository.error(error);
  }
}
