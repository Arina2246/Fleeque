import 'package:data/data_souces/hive/authentification/user_hive_service.dart';
import 'package:domain/entities/user/user_entities.dart';
import 'package:domain/repository/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserHiveService hiveService;

  UserRepositoryImpl({required this.hiveService});

  @override
  Future<UserEntity> getUserData() async => hiveService.getUserData();

  @override
  Future<void> putUserData(UserEntity data) async =>
      hiveService.putUserData(data);

  @override
  Future<void> deleteUserData() async => hiveService.deleteUserData();
}
