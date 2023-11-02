import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/model/user/remote/user_model.dart';
import 'package:domain/entities/user/user_entities.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirebaseProvider {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  FirebaseProvider({required this.firestore, required this.storage});

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

  Future<void> updateUserImg({required File img, required String uid}) async {
    String fileName = basename(img.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('users/$fileName');
    await firebaseStorageRef.putFile(img);
    String imgUrl = await firebaseStorageRef.getDownloadURL();
    final userCollectionRef = firestore.collection("users").doc(uid);
    await userCollectionRef.update({'img': imgUrl});
  }
}
