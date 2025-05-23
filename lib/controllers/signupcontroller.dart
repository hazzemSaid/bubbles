import 'package:bubbels/bloc/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void signupcontroller(
  BuildContext context,
  String email,
  String password,
  String name,
) {
  final authCubit = context.read<AuthCubit>();
  authCubit.signUp(email, password, name);
}
