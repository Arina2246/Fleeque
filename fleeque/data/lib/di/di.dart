import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/di/authentification/di.dart';
import 'package:data/di/influencers/di.dart';
import 'package:data/di/user/di.dart';
import 'package:data/model/user/local/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:core/data_constants/authentification.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

GetIt sl = GetIt.I;

Future<void> init() async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final Box<UserModel> box = Hive.box<UserModel>(user);
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => storage);
  sl.registerLazySingleton(() => box);

  await authentificationDI();
  await influencersDI();
  await userDI();
}
