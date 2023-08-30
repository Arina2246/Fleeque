import 'package:domain/repository/login/login_repository.dart';

class IsSignInUseCase {
  final LoginRepository repository;

  IsSignInUseCase({required this.repository});

  Future<bool> call() async {
    return repository.isSignIn();
  }
}
