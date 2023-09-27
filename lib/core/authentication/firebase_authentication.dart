import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:optilife/features/user_account/user_account.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? get currentUser => auth.currentUser;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return signInWithEmailAndPassword(email: email, password: password);
      }
      rethrow;
    }
  }

  // Future<User?> signInWithEmailAndPassword(
  //     {required String email, required String password}) async {
  //   final credential = await _auth.signInWithEmailAndPassword(
  //       email: email, password: password);
  //   return credential.user;
  // }
 Future <void> signInWithEmailAndPassword({
  required String email, required String password}
 ) async {
  await auth.signInWithEmailAndPassword(email: email, password: password);
 }

  // Future<GoogleSignInAccount?> googleSignIn() async {
  //   final googleUser = await _googleSignIn.signIn();
  //  final googleAuth = await googleUser?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  //   await _auth.signInWithCredential(credential);
  //   return googleUser;
  // }

  Future<void> forgotPassword({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future<Map<String, String>> authHeaders() async {
    final user = auth.currentUser;
    if (user == null) {
      throw const Text('The user is not authenticated');
    }

    String? token = await user.getIdToken();
    return {'Authorization': "Bearer $token"};
  }


  Future<void> logOut() async {
    await auth.signOut();
  }
}
