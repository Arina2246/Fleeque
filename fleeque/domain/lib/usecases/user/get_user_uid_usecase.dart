import 'package:domain/entities/user/user_entities.dart';
import 'package:domain/repository/user/user_repository.dart';

class GetUserUidUseCase {
  final UserRepository repository;

  GetUserUidUseCase({required this.repository});

  Future<UserEntity> call() async {
    return repository.getUserUid();
  }
}
