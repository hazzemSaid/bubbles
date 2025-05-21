// lib/router/app_router.dart

import 'package:bubbels/screens/Login_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  login,
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
  ],
);
