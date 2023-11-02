import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProvider {
  final FirebaseFirestore firestore;

  FirebaseProvider({required this.firestore});

  Stream<QuerySnapshot<Map<String, dynamic>>> getFirebaseCollectionStream() {
    return firestore.collection("influencers").snapshots();
  }
}
