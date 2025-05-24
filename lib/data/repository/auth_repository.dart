import 'package:bubbels/data/interface/auth_interface.dart';
import 'package:bubbels/services/google_signin_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository extends IAuth {
  FirebaseAuth? _firebaseAuth;
  final GoogleSignInService _googleSignInService = GoogleSignInService();

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
    // Sign out from Firebase
    await _firebaseAuth?.signOut();

    // Also sign out from Google using the service
    await _googleSignInService.signOut();
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

  @override
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Use the Google Sign-In service to handle the sign-in flow
      final userCredential = await _googleSignInService.signIn();

      // Check if this is a new user
      if (userCredential?.additionalUserInfo?.isNewUser ?? false) {
        final user = userCredential?.user;
        await saveUserToDatabase(user?.displayName ?? 'Google User');
      }

      return userCredential;
    } catch (e) {
      print('Google Sign-In error in repository: ${e.toString()}');
      // Let the calling code handle the exception
      rethrow;
    }
  }
}
