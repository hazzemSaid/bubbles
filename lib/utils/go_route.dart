// lib/router/app_router.dart

import 'package:bubbels/screens/Login_screen.dart';
import 'package:bubbels/screens/SignUp_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  login,
  signup,
  home,
  detail,
  settings,
  profile,
  search,
  notifications,
  favorites,
  messages,
  cart,
  orders,
  wishlist,
  help,
  about,
  privacy,
  terms,
}

final GoRouter appRouter = GoRouter(
  initialLocation: Login.routeName,

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
  ],
);
