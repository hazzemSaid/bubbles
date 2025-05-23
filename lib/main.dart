import 'package:bubbels/bloc/auth/auth_cubit.dart';
import 'package:bubbels/blocobserve.dart';
import 'package:bubbels/data/repository/auth_repository.dart';
import 'package:bubbels/firebase_options.dart';
import 'package:bubbels/utils/go_route.dart';
import 'package:bubbels/utils/modeThemes.dart';
import 'package:bubbels/utils/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  Bloc.observer = MyBlocObserver();
  final authCubit = AuthCubit(AuthRepository());
  final router = appRouter(authCubit);
  runApp(
    MultiProvider(
      providers: [
        BlocProvider.value(value: authCubit),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(appRouter: router),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter appRouter;
  const MyApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    // Get the current theme mode from the ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        title: 'Bubbles',
        theme: lightThemeData,
        darkTheme: darkThemeData,
        themeMode: themeProvider.themeMode, // Use the theme mode from provider
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
      builder: (context, child) {
        return child!;
      },
    );
  }
}
