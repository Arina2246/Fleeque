import 'package:domain/entities/authentification/authentification_entities.dart';

abstract class AuthentificationRepository {
  Future<bool> isSignIn();
  Future<void> signIn(AuthentificationEntity user);
  Future<void> signUp(AuthentificationEntity user);
  Future<void> signOut();
  Future<String> getCurrentUid();
  String error(Object error);
  Future<void> forgotPassword(String email);
  Future<void> signInWithGoogle();
}
