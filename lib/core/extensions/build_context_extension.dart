import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  /// Snackbar base
  void _showSnackBar({
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    // Clear any existing snackbars
    ScaffoldMessenger.of(this).clearSnackBars();

    // Show new snackbar
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: <Widget>[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: Text(message, style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(8),
      ),
    );
  }

  /// Show success snackbar
  void showSuccessSnackBar(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
    );
  }

  /// Show error snackbar
  void showErrorSnackBar(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error,
    );
  }

  /// Show info snackbar
  void showInfoSnackBar(String message) {
    _showSnackBar(
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info,
    );
  }
}
