import 'package:domain/repository/login/login_repository.dart';

class GetCurrentUidUseCase {
  final LoginRepository repository;

  GetCurrentUidUseCase({required this.repository});

  Future<String> call() async {
    return repository.getCurrentUId();
  }
}
