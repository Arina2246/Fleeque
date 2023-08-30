import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/entities/login/login_entities.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? name,
    final String? email,
    final String? uid,
    final String? status,
    final String? password,
  }) : super(
            uid: uid,
            name: name,
            email: email,
            password: password,
            status: status);

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      status: documentSnapshot.get('status'),
      name: documentSnapshot.get('name'),
      uid: documentSnapshot.get('uid'),
      email: documentSnapshot.get('email'),
      password: documentSnapshot.get('password'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "status": status,
      "uid": uid,
      "email": email,
      "name": name,
      "password": password
    };
  }
}
