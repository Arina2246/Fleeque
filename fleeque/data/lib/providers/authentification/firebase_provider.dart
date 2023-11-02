import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/model/user/remote/user_model.dart';
import 'package:domain/entities/authentification/authentification_entities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseProvider {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseProvider({required this.auth, required this.firestore});

  Future<String> getCurrentUid() async => auth.currentUser!.uid;

  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  Future<void> signIn(AuthentificationEntity user) async => auth
      .signInWithEmailAndPassword(email: user.email, password: user.password);

  Future<void> signOut() async => auth.signOut();

  Future<void> signUp(AuthentificationEntity user) async {
    auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);
    final currentUid = await getCurrentUid();
    await saveUserToDB(
      email: user.email,
      uid: currentUid,
      password: user.password,
    );
  }

  String error(Object error) => error.toString();

  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await auth.signInWithCredential(credential);

    final user = auth.currentUser;
    saveUserToDB(
      email: user!.email ?? '',
      uid: user.uid,
      password: '',
    );
  }

  Future<void> saveUserToDB(
      {required String uid,
      required String email,
      required String password}) async {
    final userCollectionRef = firestore.collection("users");
    final uid = await getCurrentUid();
    userCollectionRef.doc(uid).get().then((value) {
      final newUser = UserModel(
              uid: uid,
              email: email,
              password: password,
              name: null,
              img: null,
              bankAccount: null,
              insta: null,
              number: null)
          .toDocument();
      if (!value.exists) {
        userCollectionRef.doc(uid).set(newUser);
      }
      return;
    });
  }
}
