import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String error;
  AuthFailure(this.error);
  @override
  List<Object?> get props => [error];
}

class Authenticated extends AuthState {
  final String userId;
  Authenticated(this.userId);
  @override
  List<Object?> get props => [userId];
}

class Unauthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}
