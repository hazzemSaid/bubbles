import 'package:bubbels/bloc/auth/auth_cubit.dart';
import 'package:bubbels/data/repository/auth_repository.dart';
import 'package:bubbels/firebase_options.dart';
import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/utils/go_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final authCubit = AuthCubit(AuthRepository());

  runApp(
    BlocProvider.value(
      value: authCubit,

      child: MyApp(authCubit: authCubit),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AuthCubit authCubit;
  const MyApp({super.key, required this.authCubit});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Bubbles',
          theme: ThemeData(),
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.thunder,
          ),
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter(authCubit),
        );
      },
    );
  }
}
