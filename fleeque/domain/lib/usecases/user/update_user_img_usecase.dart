import 'dart:io';

import 'package:domain/repository/user/user_repository.dart';

class UpdateUserImgUseCase {
  final UserRepository repository;

  UpdateUserImgUseCase({required this.repository});

  Future<void> call(File img) async {
    return repository.updateUserImg(img);
  }
}
