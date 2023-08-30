import 'package:domain/repository/login/login_repository.dart';

class SignOutUseCase {
  final LoginRepository repository;

  SignOutUseCase({required this.repository});

  Future<void> call() async {
    return repository.signOut();
  }
}
