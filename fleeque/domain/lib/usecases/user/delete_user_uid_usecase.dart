import 'package:domain/repository/user/user_repository.dart';

class DeleteUserUidUseCase {
  final UserRepository repository;

  DeleteUserUidUseCase({required this.repository});

  Future<void> call() async {
    return repository.deleteUserUid();
  }
}
