import 'package:bubbels/firebase_options.dart';
import 'package:bubbels/utils/go_route.dart';
import 'package:bubbels/utils/modeThemes.dart';
import 'package:bubbels/utils/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get the current theme mode from the ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Wrap with ScreenUtilInit for responsive dimensions
    return ScreenUtilInit(
      // Design size based on standard smartphone dimensions - iPhone 12/13
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
          routerConfig: appRouter,
        );
      },
    );
  }
}
