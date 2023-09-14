import 'package:domain/entities/user/user_entities.dart';
import 'package:domain/repository/user/user_repository.dart';

class PutUserDataUseCase {
  final UserRepository repository;

  PutUserDataUseCase({required this.repository});

  Future<void> call(UserEntity data) async {
    return repository.putUserData(data);
  }
}
