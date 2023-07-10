import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppApi{
  // firebase auth instance
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firebaseStore= FirebaseFirestore.instance;

  // get organizations data
  static Stream<QuerySnapshot<Map<String, dynamic>>> getOrganizations() {
    return firebaseStore
        .collection('organizations').snapshots();
  }

}