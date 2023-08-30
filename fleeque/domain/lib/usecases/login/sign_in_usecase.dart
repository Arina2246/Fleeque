import 'package:domain/entities/login/login_entities.dart';
import 'package:domain/repository/login/login_repository.dart';

class SignInUseCase {
  final LoginRepository repository;

  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.signIn(user);
  }
}
