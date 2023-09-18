import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/model/user/remote/user_model.dart';
import 'package:domain/entities/user/user_entities.dart';

class FirebaseProvider {
  final FirebaseFirestore firestore;

  FirebaseProvider({required this.firestore});

  Future<UserEntity> getUserData(String uid) async {
    final userCollectionRef = firestore.collection("users");
    UserEntity user = await userCollectionRef.doc(uid).get().then<dynamic>(
      (value) async {
        return UserModel.fromSnapshot(value);
      },
    );
    return user;
  }

  Future<void> updateUserData(
      {required UserEntity user, required String uid}) async {
    final userCollectionRef = firestore.collection("users").doc(uid);
    var updatedFields = {
      if (user.name != null) 'name': user.name,
      if (user.email != null) 'email': user.email,
      if (user.password != null) 'password': user.password,
      if (user.bankAccount != null) 'bankAccount': user.bankAccount,
      if (user.insta != null) 'insta': user.insta,
      if (user.number != null) 'number': user.number,
    };
    userCollectionRef.update(updatedFields);
  }
}
