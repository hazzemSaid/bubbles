import 'package:bubbels/utils/constants.dart';
import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData(
  primaryColor: AppColors.luxorGold,
  scaffoldBackgroundColor: AppColors.white,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.white,
    iconTheme: IconThemeData(color: AppColors.black),
    foregroundColor: AppColors.black,
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.luxorGold,
    secondary: AppColors.luxorGold,
    surface: AppColors.wildSand,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onSurface: AppColors.black,
  ),
  cardColor: AppColors.white,
  dividerColor: AppColors.athensGray1,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.luxorGold,
    unselectedItemColor: AppColors.grayChateau,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.white,
  ),
  tabBarTheme: const TabBarThemeData(
    labelColor: AppColors.luxorGold,
    unselectedLabelColor: AppColors.grayChateau,
    indicator: BoxDecoration(color: AppColors.athensGray2),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.athensGray2,
    contentTextStyle: TextStyle(color: AppColors.black),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: AppColors.athensGray2,
    labelStyle: TextStyle(color: AppColors.black),
    secondaryLabelStyle: TextStyle(color: AppColors.black),
    brightness: Brightness.light,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: AppColors.luxorGold,
    inactiveTrackColor: AppColors.athensGray1,
    thumbColor: AppColors.luxorGold,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.luxorGold),
    trackColor: WidgetStateProperty.all(AppColors.athensGray1),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.luxorGold,
  ),
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      color: AppColors.athensGray2,
      borderRadius: BorderRadius.circular(4),
    ),
    textStyle: const TextStyle(color: AppColors.black),
  ),
  iconTheme: const IconThemeData(color: AppColors.black),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.black),
    bodyMedium: TextStyle(color: AppColors.doveGray),
    bodySmall: TextStyle(color: AppColors.grayChateau),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.luxorGold,
    selectionColor: Color(0xFFE3D4B4), // Light version of luxorGold
    selectionHandleColor: AppColors.luxorGold,
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: AppColors.white,
    titleTextStyle: TextStyle(color: AppColors.black, fontSize: 20),
    contentTextStyle: TextStyle(color: AppColors.doveGray),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.luxorGold,
    foregroundColor: AppColors.white,
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.luxorGold,
    textColor: AppColors.black,
  ),
);

final ThemeData darkThemeData = ThemeData(
  primaryColor: AppColors.luxorGold,
  scaffoldBackgroundColor: const Color(0xFF121212), // Dark background
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF121212),
    iconTheme: IconThemeData(color: AppColors.white),
    foregroundColor: AppColors.white,
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColors.luxorGold,
    secondary: AppColors.luxorGold,
    surface: const Color(0xFF1E1E1E), // Slightly lighter than background
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    onSurface: AppColors.white,
  ),
  cardColor: const Color(0xFF1E1E1E),
  dividerColor: const Color(0xFF2C2C2C),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF121212),
    selectedItemColor: AppColors.luxorGold,
    unselectedItemColor: Color(0xFFAAAAAA),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFF1E1E1E),
  ),
  tabBarTheme: const TabBarThemeData(
    labelColor: AppColors.luxorGold,
    unselectedLabelColor: Color(0xFFAAAAAA),
    indicator: BoxDecoration(color: Color(0xFF2C2C2C)),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFF2C2C2C),
    contentTextStyle: TextStyle(color: AppColors.white),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0xFF2C2C2C),
    labelStyle: TextStyle(color: AppColors.white),
    secondaryLabelStyle: TextStyle(color: AppColors.white),
    brightness: Brightness.dark,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: AppColors.luxorGold,
    inactiveTrackColor: Color(0xFF3C3C3C),
    thumbColor: AppColors.luxorGold,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all(AppColors.luxorGold),
    trackColor: WidgetStateProperty.all(const Color(0xFF3C3C3C)),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.luxorGold,
  ),
  tooltipTheme: TooltipThemeData(
    decoration: BoxDecoration(
      color: const Color(0xFF2C2C2C),
      borderRadius: BorderRadius.circular(4),
    ),
    textStyle: const TextStyle(color: AppColors.white),
  ),
  iconTheme: const IconThemeData(color: AppColors.white),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.white),
    bodyMedium: TextStyle(color: Color(0xFFCCCCCC)),
    bodySmall: TextStyle(color: Color(0xFFAAAAAA)),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.luxorGold,
    selectionColor: Color(0xFF65574A), // Dark version of luxorGold
    selectionHandleColor: AppColors.luxorGold,
  ),
  dialogTheme: const DialogThemeData(
    backgroundColor: Color(0xFF1E1E1E),
    titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20),
    contentTextStyle: TextStyle(color: Color(0xFFCCCCCC)),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.luxorGold,
    foregroundColor: AppColors.white,
  ),
  listTileTheme: const ListTileThemeData(
    iconColor: AppColors.luxorGold,
    textColor: AppColors.white,
  ),
);
