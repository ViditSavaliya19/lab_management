import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
  FirebaseHelper._();

  static final FirebaseHelper firebaseHelper = FirebaseHelper._();

  // Firebase SingUp With Email & Password

  void signUP(String email, String password) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => print("Success"))
        .catchError((error) {
      print(error);
    });
  }

  void signIn(String email, String password) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => print("Success"))
        .catchError((error) {
      print(error);
    });
  }

  // FireStore Read Lab data

Stream<DocumentSnapshot<Map<String, dynamic>>> getAllLab()
{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  return firebaseFirestore.collection("Branch").doc("RNW4").snapshots();
}
}
