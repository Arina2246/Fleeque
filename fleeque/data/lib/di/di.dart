import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/di/authentification/di.dart';
import 'package:data/di/influencers/di.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.I;

Future<void> init() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => storage);

  await authentificationDI();
  await influencersDI();
}
