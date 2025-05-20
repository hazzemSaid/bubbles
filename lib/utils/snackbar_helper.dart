import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black87,
      action: SnackBarAction(
        label: 'OK',
        textColor: Colors.white,
        onPressed: () {
          // later in your code
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
