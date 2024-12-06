import 'package:flutter/material.dart';

class Snakbar {
  final String message;
  final bool isError;
  Snakbar({required this.message, required this.isError});
  static show(BuildContext context, String message, bool isError) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red.shade400 : Colors.green.shade400,
      ),
    );
  }
}
