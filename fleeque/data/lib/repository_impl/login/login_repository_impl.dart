import 'package:data/data_souces/login/login_service.dart';
import 'package:domain/entities/login/login_entities.dart';
import 'package:domain/repository/login/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginService dataSource;

  LoginRepositoryImpl({required this.dataSource});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      dataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUId() async => dataSource.getCurrentUId();

  @override
  Future<bool> isSignIn() async => dataSource.isSignIn();

  @override
  Future<void> signIn(UserEntity user) async => dataSource.signIn(user);

  @override
  Future<void> signOut() async => dataSource.signOut();

  @override
  Future<void> signUp(UserEntity user) async => dataSource.signUp(user);

  @override
  String errorLogin(Object error) => dataSource.errorLogin(error);

  @override
  Future<void> forgotPassword(String email) async =>
      dataSource.forgotPassword(email);

  @override
  Future<void> signInWithGoogle() async => dataSource.signInWithGoogle();
}
