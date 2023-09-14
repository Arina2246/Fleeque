import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/entities/authentification/authentification_entities.dart';

class AuthentificationModel extends AuthentificationEntity {
  const AuthentificationModel({
    required final String email,
    required final String password,
  }) : super(
          email: email,
          password: password,
        );

  factory AuthentificationModel.fromSnapshot(
      DocumentSnapshot documentSnapshot) {
    return AuthentificationModel(
      email: documentSnapshot.get('email'),
      password: documentSnapshot.get('password'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {"email": email, "password": password};
  }
}
