import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_auth.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? uid;
  Stream<UserAuth?> get user {
    return _firebaseAuth.authStateChanges().map(
          (event) => _userFromFirebaseUser(event),
        );
  }

  UserAuth? _userFromFirebaseUser(User? user) {
    return user != null ? UserAuth(user.uid) : null;
  }

  signInAnonimo() async {
    await _firebaseAuth.signInAnonymously();
  }

  signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  createUserWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}