import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class GoogleSignInService {
  // This is a singleton pattern implementation
  static final GoogleSignInService _instance = GoogleSignInService._internal();
  factory GoogleSignInService() => _instance;
  GoogleSignInService._internal();

  // Create instance of GoogleSignIn
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Using only basic scopes for better compatibility
    scopes: ['email'],
  );

  // Method to sign in with Google
  Future<UserCredential?> signIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // If user cancels the sign in process
      if (googleUser == null) {
        print('Google Sign-In was canceled by user');
        // Return null to indicate cancellation, caller should handle this
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // Throw a single simple exception
      throw Exception(e);
    }
  }

  // Method to sign out
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print('Error signing out from Google: $e');
    }
  }
}
