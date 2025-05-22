import 'package:bloc/bloc.dart';
import 'package:bubbels/bloc/auth/auth_state.dart';
import 'package:bubbels/data/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
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
      checkAuthStatus();
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signUp(String email, String password) async {
    emit(AuthLoading());
    try {
      await authRepository.signUpWithEmailAndPassword(email, password);
      checkAuthStatus();
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signOut() async {
    await authRepository.signOut();
    emit(Unauthenticated());
  }
}
