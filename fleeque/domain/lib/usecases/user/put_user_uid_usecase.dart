import 'package:domain/entities/user/user_entities.dart';
import 'package:domain/repository/user/user_repository.dart';

class PutUserUidUseCase {
  final UserRepository repository;

  PutUserUidUseCase({required this.repository});

  Future<void> call(UserEntity data) async {
    return repository.putUserUid(data);
  }
}
