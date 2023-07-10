import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AppApi {
  // firebase auth instance
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firebaseStore = FirebaseFirestore.instance;
  static FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  // get organizations data
  static Stream<QuerySnapshot<Map<String, dynamic>>> getOrganizations() {
    return firebaseStore.collection('organizations').snapshots();
  }

  // get child data
  static Stream<QuerySnapshot<Map<String, dynamic>>> getVictims(
      {bool isOnlyMe = false}) {
    if (isOnlyMe) {
      return firebaseStore
          .collection('victims')
          .where('submitted_by', isEqualTo: firebaseAuth.currentUser!.uid)
          .snapshots();
    } else {
      return firebaseStore.collection('victims').snapshots();
    }
  }

  //post child data
  static Future<void> postVictimData(
      {required String name,
      required File file,
      required String address}) async {
    final ext = file.path.split('.').last;

    //storage file ref with path
    final ref = firebaseStorage.ref().child(
        'victims/${file.path.split(".")[0].split("/").last + firebaseAuth.currentUser!.uid}.$ext');

    //uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {});

    var imageUrl = await ref.getDownloadURL();

    return firebaseStore.collection('victims').doc().set({
      "address": address,
      "image": imageUrl,
      "is_receive": false,
      "name": name,
      "submitted_by": firebaseAuth.currentUser!.uid,
    });
  }
}
