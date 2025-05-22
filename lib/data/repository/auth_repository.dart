import 'package:bubbels/data/interface/auth_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository extends IAuth {
  FirebaseAuth? _firebaseAuth;
  AuthRepository({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  Future<void> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<void> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _firebaseAuth?.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    _firebaseAuth?.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> updateProfile(String name, String photoUrl) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  User? get currentUser => _firebaseAuth?.currentUser;
}
