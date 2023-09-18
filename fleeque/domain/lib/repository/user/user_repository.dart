import 'package:domain/entities/user/user_entities.dart';

abstract class UserRepository {
  Future<UserEntity> getUserUid();
  Future<void> putUserUid(UserEntity data);
  Future<void> deleteUserUid();
  Future<UserEntity> getUserData();
  Future<void> updateUserData(UserEntity user);
}
