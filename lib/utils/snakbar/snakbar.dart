import 'package:flutter/material.dart';

class SnackBarWidget {
  static void showSnackbar(BuildContext context, String errorMessage,
      {Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: color ?? Colors.green, content: Text(errorMessage)),
    );
  }
}
