import 'package:domain/entities/user/user_entities.dart';
import 'package:domain/repository/user/user_repository.dart';

class UpdateUserDataUseCase {
  final UserRepository repository;

  UpdateUserDataUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.updateUserData(user);
  }
}
