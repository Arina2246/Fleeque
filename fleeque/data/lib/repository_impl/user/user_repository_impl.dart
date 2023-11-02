import 'dart:io';

import 'package:data/data_souces/hive/authentification/user_hive_service.dart';
import 'package:data/providers/user/firebase_provider.dart';
import 'package:domain/entities/user/user_entities.dart';
import 'package:domain/repository/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserHiveService hiveService;
  final FirebaseProvider provider;

  UserRepositoryImpl({required this.hiveService, required this.provider});

  @override
  Future<UserEntity> getUserUid() async => hiveService.getUserUid();

  @override
  Future<void> putUserUid(UserEntity data) async =>
      hiveService.putUserUid(data);

  @override
  Future<void> deleteUserUid() async => hiveService.deleteUserUid();

  @override
  Future<UserEntity> getUserData() async {
    var uid = await hiveService.getUserUid();
    var userData = provider.getUserData(uid.uid);
    return userData;
  }

  @override
  Future<void> updateUserData(UserEntity user) async {
    var uid = await hiveService.getUserUid();
    provider.updateUserData(user: user, uid: uid.uid);
  }

  @override
  Future<void> updateUserImg(File img) async {
    var uid = await hiveService.getUserUid();
    provider.updateUserImg(img: img, uid: uid.uid);
  }
}
