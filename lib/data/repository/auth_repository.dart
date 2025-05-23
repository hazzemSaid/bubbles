import 'package:bubbels/data/interface/auth_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    await _firebaseAuth?.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth?.signOut();
    return;
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth?.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> updateProfile(String name, String photoUrl) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  Future<void> saveUserToDatabase(String name) async {
    final user = _firebaseAuth?.currentUser;

    await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
      'name': name,
      'uid': user?.uid,
      'phoneNumber': user?.phoneNumber,
      'displayName': user?.displayName,
      'email': user?.email,
      'photoUrl': user?.photoURL,
    });
  }

  User? get currentUser => _firebaseAuth?.currentUser;
}
