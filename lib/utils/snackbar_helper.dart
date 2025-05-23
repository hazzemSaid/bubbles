import 'package:flutter/material.dart';

class SnackBarHelper {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
  showSnackBar({
    required BuildContext context,
    required String message,
    SnackBarClosedReason? reason,
    Duration? duration,
    required Color backgroundColor,
    required Color textColor,
    SnackBarAction? action,
  }) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor,
      duration: duration ?? const Duration(seconds: 3),
      action: action,
    );

    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
