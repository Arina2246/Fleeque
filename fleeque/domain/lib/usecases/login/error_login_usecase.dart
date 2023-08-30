import 'package:domain/repository/login/login_repository.dart';

class ErrorLoginUsecase {
  final LoginRepository repository;

  ErrorLoginUsecase({required this.repository});

  String call(Object error) {
    return repository.errorLogin(error);
  }
}
