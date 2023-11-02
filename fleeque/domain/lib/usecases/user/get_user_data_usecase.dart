import 'package:domain/entities/user/user_entities.dart';
import 'package:domain/repository/user/user_repository.dart';

class GetUserDataUseCase {
  final UserRepository repository;

  GetUserDataUseCase({required this.repository});

  Future<UserEntity> call() async {
    return repository.getUserData();
  }
}
