import 'package:domain/entities/login/login_entities.dart';

abstract class LoginRepository {
  Future<bool> isSignIn();
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);
  String errorLogin(Object error);
  Future<void> forgotPassword(String email);
}
