import 'package:bubbels/firebase_options.dart';
import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/utils/go_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Wrap with ScreenUtilInit for responsive dimensions
    return ScreenUtilInit(
      // Design size based on standard smartphone dimensions - iPhone 12/13
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
          routerConfig: appRouter,
        );
      },
    );
  }
}
