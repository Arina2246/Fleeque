import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String? name;
  final String? email;
  final String? password;
  final int? bankAccount;
  final String? insta;
  final int? number;

  const UserEntity({
    required this.uid,
    this.name,
    this.email,
    this.password,
    this.bankAccount,
    this.insta,
    this.number,
  });

  @override
  List<Object?> get props => [uid];
}
