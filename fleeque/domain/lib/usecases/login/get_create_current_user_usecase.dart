import 'package:domain/entities/login/login_entities.dart';
import 'package:domain/repository/login/login_repository.dart';

class GetCreateCurrentUserUsecase {
  final LoginRepository repository;

  GetCreateCurrentUserUsecase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.getCreateCurrentUser(user);
  }
}
