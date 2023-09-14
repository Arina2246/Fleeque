import 'package:equatable/equatable.dart';

class AuthentificationEntity extends Equatable {
  final String email;
  final String password;

  const AuthentificationEntity({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
