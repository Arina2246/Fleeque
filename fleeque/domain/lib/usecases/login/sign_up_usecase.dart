import 'package:domain/entities/login/login_entities.dart';
import 'package:domain/repository/login/login_repository.dart';

class SignUpUseCase {
  final LoginRepository repository;

  SignUpUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.signUp(user);
  }
}
