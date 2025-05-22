import 'package:bubbels/utils/constants.dart';
import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData(
  primaryColor: Colors.grey[300],
  scaffoldBackgroundColor: Colors.grey[200],
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[200]!,
    iconTheme: const IconThemeData(color: Colors.black),
    foregroundColor: Colors.black,
  ),
  colorScheme: ColorScheme.light(
    primary: Colors.grey[300]!,
    secondary: AppColors.luxorGold,
    surface: Colors.grey,
    onPrimary: Colors.black,
    onSecondary: AppColors.luxorGold,
    onSurface: Colors.grey[800]!,
  ),
  cardColor: Colors.white,
  dividerColor: Colors.grey[300],
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[200]!,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black54,
  ),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
  tabBarTheme: TabBarThemeData(
    labelColor: Colors.black,
    unselectedLabelColor: Colors.black54,
    indicator: BoxDecoration(color: Colors.grey[200]),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey[200]!,
    contentTextStyle: const TextStyle(color: Colors.black),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey[200]!,
    labelStyle: const TextStyle(color: Colors.black),
    secondaryLabelStyle: const TextStyle(color: Colors.black),
    brightness: Brightness.light,
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.grey[200],
    inactiveTrackColor: Colors.grey[300],
    thumbColor: Colors.grey[300],
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.grey[200]),
    trackColor: WidgetStateProperty.all(Colors.grey[300]),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.grey[200]),
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(4),
    ),
    textStyle: const TextStyle(color: Colors.black),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
    selectionColor: Colors.grey,
    selectionHandleColor: Colors.black,
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
    contentTextStyle: TextStyle(color: Colors.black),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.black,
    textColor: Colors.black,
  ),
);

final ThemeData darkThemeData = ThemeData(
  primaryColor: Colors.black12,
  scaffoldBackgroundColor: const Color.fromARGB(115, 99, 99, 92),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.black,
    secondary: Colors.grey[900]!,
    surface: Colors.grey[850]!,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
  ),
  cardColor: Colors.grey[900],
  dividerColor: Colors.grey[800],
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white54,
  ),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.black),
  tabBarTheme: TabBarThemeData(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white54,
    indicator: BoxDecoration(color: Colors.grey[900]),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.grey[900],
    contentTextStyle: const TextStyle(color: Colors.white),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey[900]!,
    labelStyle: const TextStyle(color: Colors.white),
    secondaryLabelStyle: const TextStyle(color: Colors.white),
    brightness: Brightness.dark,
  ),
  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.grey[800],
    inactiveTrackColor: Colors.grey[700],
    thumbColor: Colors.grey[900],
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(Colors.grey[800]),
    trackColor: WidgetStateProperty.all(Colors.grey[700]),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.grey[900]),
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(4),
    ),
    textStyle: const TextStyle(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.white,
    selectionColor: Colors.white70,
    selectionHandleColor: Colors.white,
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: Colors.black,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    contentTextStyle: TextStyle(color: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: Colors.white,
    textColor: Colors.white,
  ),
);
