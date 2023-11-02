import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/entities/user/user_entities.dart';

class UserModel extends UserEntity {
  const UserModel({
    required final String? email,
    required final String uid,
    required final String? password,
    required final String? bankAccount,
    required final String? insta,
    required final String? number,
    required final String? name,
    required final String? img,
  }) : super(
          email: email,
          uid: uid,
          password: password,
          bankAccount: bankAccount,
          insta: insta,
          number: number,
          name: name,
          img: img,
        );

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> querySnapshot) {
    return UserModel(
      email: querySnapshot.get('email'),
      uid: querySnapshot.get('uid'),
      password: querySnapshot.get('password'),
      bankAccount: querySnapshot.get('bankAccount'),
      insta: querySnapshot.get('insta'),
      number: querySnapshot.get('number'),
      name: querySnapshot.get('name'),
      img: querySnapshot.get('img'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "email": email,
      "uid": uid,
      "password": password,
      "bankAccount": bankAccount,
      "insta": insta,
      "number": number,
      "name": name,
      "img": img,
    };
  }
}
