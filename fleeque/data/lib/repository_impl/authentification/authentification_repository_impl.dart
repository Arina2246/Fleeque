import 'package:data/providers/authentification/firebase_provider.dart';
import 'package:domain/repository/authentification/authentification_repository.dart';
import 'package:domain/entities/authentification/authentification_entities.dart';

class AuthentificationRepositoryImpl extends AuthentificationRepository {
  final FirebaseProvider provider;

  AuthentificationRepositoryImpl({required this.provider});

  @override
  Future<String> getCurrentUid() async => provider.getCurrentUid();

  @override
  Future<bool> isSignIn() async => provider.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async => provider.signIn(user);

  @override
  Future<void> signOut() async => provider.signOut();

  @override
  Future<void> signUp(UserEntity user) async => provider.signUp(user);

  @override
  String error(Object error) => provider.error(error);

  @override
  Future<void> forgotPassword(String email) async =>
      provider.forgotPassword(email);

  @override
  Future<void> signInWithGoogle() async => provider.signInWithGoogle();
}
