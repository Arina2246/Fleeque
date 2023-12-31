import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String? name;
  final String? email;
  final String? password;
  final String? bankAccount;
  final String? insta;
  final String? number;
  final String? img;

  const UserEntity({
    required this.uid,
    this.name,
    this.email,
    this.password,
    this.bankAccount,
    this.insta,
    this.number,
    this.img,
  });

  @override
  List<Object?> get props => [uid];
}
