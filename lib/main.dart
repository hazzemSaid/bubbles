import 'package:bubbels/bloc/auth/auth_cubit.dart';
import 'package:bubbels/data/repository/auth_repository.dart';
import 'package:bubbels/firebase_options.dart';
import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/utils/go_route.dart';
import 'package:bubbels/utils/modeThemes.dart';
import 'package:bubbels/utils/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authCubit = AuthCubit(AuthRepository());

  runApp(
    MultiProvider(
      providers: [
        BlocProvider.value(value: authCubit),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(authCubit: authCubit),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthCubit authCubit;
  const MyApp({super.key, required this.authCubit});

  @override
  Widget build(BuildContext context) {
    // Get the current theme mode from the ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Bubbles',
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode:
              themeProvider.themeMode, // Use the theme mode from provider
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter(authCubit),
        );
      },
    );
  }
}
