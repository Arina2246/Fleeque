import 'package:domain/repository/authentification/authentification_repository.dart';

class GetCurrentUidUseCase {
  final AuthentificationRepository repository;

  GetCurrentUidUseCase({required this.repository});

  Future<String> call() async {
    return repository.getCurrentUid();
  }
}
