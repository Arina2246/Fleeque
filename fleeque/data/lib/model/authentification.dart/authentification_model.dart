import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/entities/authentification/authentification_entities.dart';

class UserModel extends UserEntity {
  const UserModel({
    required final String email,
    required final String password,
  }) : super(
          email: email,
          password: password,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      email: documentSnapshot.get('email'),
      password: documentSnapshot.get('password'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {"email": email, "password": password};
  }
}
