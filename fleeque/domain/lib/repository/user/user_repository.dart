import 'package:domain/entities/user/user_entities.dart';

abstract class UserRepository {
  Future<UserEntity> getUserData();
  Future<void> putUserData(UserEntity data);
  Future<void> deleteUserData();
}
