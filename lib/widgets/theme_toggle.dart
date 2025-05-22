import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bubbels/utils/theme_provider.dart';

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Switch(
      value: isDarkMode,
      onChanged: (value) {
        themeProvider.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
      },
      activeColor: Theme.of(context).colorScheme.secondary,
    );
  }
}

class ThemeToggleIcon extends StatelessWidget {
  const ThemeToggleIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using listen: false to prevent rebuilds
    final themeProvider = Provider.of<ThemeProvider>(context, listen: true);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          // Use a microtask to delay the theme change until after the current build phase
          Future.microtask(() {
            themeProvider.toggleTheme();
          });
        },
        child: Ink(
          decoration: BoxDecoration(
            color: theme.brightness == Brightness.dark
                ? Colors.black26
                : Colors.white54,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: theme.colorScheme.onSurface,
              size: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
