import 'package:bubbels/bloc/auth/auth_state.dart';
import 'package:bubbels/data/repository/auth_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial()) {
    checkAuthStatus();
  }

  void checkAuthStatus() {
    final user = authRepository.currentUser;
    if (user != null) {
      emit(Authenticated(user.uid));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.signInWithEmailAndPassword(email, password);
      emit(AuthSuccess());
      checkAuthStatus();
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signUp(String email, String password, String name) async {
    emit(AuthLoading());
    try {
      await authRepository.signUpWithEmailAndPassword(email, password);
      emit(AuthSuccess());
      await authRepository.saveUserToDatabase(name);
      checkAuthStatus();
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signOut() async {
    await authRepository.signOut();
    emit(Unauthenticated());
  }

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final userCredential = await authRepository.signInWithGoogle();
      if (userCredential != null) {
        emit(AuthSuccess());
        checkAuthStatus();
      } else {
        emit(AuthFailure('Google Sign-In failed'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      final isAuthenticated = json['isAuthenticated'] as bool? ?? false;
      final userId = json['userId'] as String?;
      if (isAuthenticated && userId != null) {
        return Authenticated(userId);
      }
    } catch (e) {
      print('Error parsing AuthState: $e');
    }
    return Unauthenticated();
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    if (state is Authenticated) {
      return {'isAuthenticated': true, 'userId': state.userId};
    } else {
      return {'isAuthenticated': false};
    }
  }
}
