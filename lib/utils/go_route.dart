import 'package:bubbels/bloc/auth/auth_cubit.dart';
import 'package:bubbels/bloc/auth/auth_state.dart';
import 'package:bubbels/screens/Login_screen.dart';
import 'package:bubbels/screens/SignUp_screen.dart';
import 'package:bubbels/screens/home_screen.dart';
import 'package:bubbels/utils/GoRouterRefreshStream.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { login, signup, home }

GoRouter appRouter(AuthCubit authCubit) {
  return GoRouter(
    initialLocation: Login.routeName,
    refreshListenable: GoRouterRefreshStream(authCubit.stream),

    redirect: (BuildContext context, GoRouterState state) {
      final authState = authCubit.state;

      final isLoggedIn = authState is Authenticated;
      final loggingIn =
          state.fullPath == Login.routeName ||
          state.fullPath == SignUp.routeName;
      if (!isLoggedIn && !loggingIn) {
        return Login.routeName;
      }

      if (isLoggedIn && loggingIn) {
        return '/home';
      }

      return null;
    },

    routes: <RouteBase>[
      GoRoute(
        path: Login.routeName,
        name: AppRoute.login.name,
        builder: (context, state) => Login(),
      ),
      GoRoute(
        path: SignUp.routeName,
        name: AppRoute.signup.name,
        builder: (context, state) => const SignUp(),
      ),
      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
