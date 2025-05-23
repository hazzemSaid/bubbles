import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuth {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<UserCredential?> signInWithGoogle();
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<void> updateProfile(String name, String photoUrl);
  Future<void> deleteAccount();
}
