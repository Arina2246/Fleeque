import 'package:domain/repository/login/login_repository.dart';

class SignInWithGoogleUsecase {
  final LoginRepository repository;

  SignInWithGoogleUsecase({required this.repository});

  Future<void> call() {
    return repository.signInWithGoogle();
  }
}
