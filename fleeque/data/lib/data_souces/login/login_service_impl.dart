import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/data_souces/login/login_service.dart';
import 'package:data/model/login/login_model.dart';
import 'package:domain/entities/login/login_entities.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginServiceImpl implements LoginService {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  LoginServiceImpl({required this.auth, required this.firestore});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollectionRef = firestore.collection("users");
    final uid = await getCurrentUId();
    userCollectionRef.doc(uid).get().then((value) {
      final newUser = UserModel(
              uid: uid,
              status: user.status,
              email: user.email,
              name: user.name,
              password: user.password)
          .toDocument();
      if (!value.exists) {
        userCollectionRef.doc(uid).set(newUser);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signIn(UserEntity user) async => auth.signInWithEmailAndPassword(
      email: user.email!, password: user.password!);

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  Future<void> signUp(UserEntity user) async =>
      auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);

  @override
  String errorLogin(Object error) => error.toString();

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
