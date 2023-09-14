import 'package:data/model/user/user_model.dart';
import 'package:core/data_constants/authentification.dart';
import 'package:domain/entities/user/user_entities.dart';
import 'package:hive/hive.dart';

class UserHiveService {
  final Box<UserModel> box;
  UserHiveService({
    required this.box,
  });

  Future<UserEntity> getUserData() async {
    var data = box.get(user);
    UserEntity dataObj = UserEntity(
      uid: data!.uid,
    );
    return dataObj;
  }

  Future<void> putUserData(UserEntity data) async {
    box.put(
        user,
        UserModel(
          uid: data.uid,
        ));
  }

  Future<void> deleteUserData() async {
    await box.delete(user);
  }
}
