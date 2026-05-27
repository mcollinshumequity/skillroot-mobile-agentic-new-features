import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alert {
  static void success(String message, {String title = "Success"}) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: Colors.green.withAlpha(230),
      icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 28),
    );
  }

  static void error(String message, {String title = "Error"}) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: Colors.red.withAlpha(230),
      icon: const Icon(Icons.error_outline, color: Colors.white, size: 28),
    );
  }

  static void info(String message, {String title = "Notification"}) {
    _showSnackbar(
      title: title,
      message: message,
      backgroundColor: const Color(0xff1f2a3d).withAlpha(230),
      icon: const Icon(Icons.info_outline, color: Colors.white, size: 28),
    );
  }

  static void _showSnackbar({
    required String title,
    required String message,
    required Color backgroundColor,
    required Widget icon,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
      icon: icon,
      margin: const EdgeInsets.all(12),
      borderRadius: 16,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
      boxShadows: [
        BoxShadow(
          color: Colors.black.withAlpha(51),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
      shouldIconPulse: true,
      titleText: Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
