import 'package:domain/repository/user/user_repository.dart';

class DeleteUserDataUseCase {
  final UserRepository repository;

  DeleteUserDataUseCase({required this.repository});

  Future<void> call() async {
    return repository.deleteUserData();
  }
}
