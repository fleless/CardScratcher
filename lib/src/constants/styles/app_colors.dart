import 'package:flutter/material.dart';

/// This class provides custom colors to be used in the project.
///
class AppColors {
  AppColors._();

  static const Color appBackground = Color(0xFFF5F6F8);
  static const Color default_yellow = Color(0xFFFFD700);
  static const Color default_pink = Color(0xFFD63281);
  static const Color green = Color(0xFF00D975);
  static const Color greenlight = Color(0xFFe6fff3); // green 10%
  static const Color gmailColor = Color(0xFFE65A4D); // green 10%

  static Map<int, Color> colorCodes = {
    50: const Color.fromRGBO(0, 217, 117, .1),
    100: const Color.fromRGBO(0, 217, 117, 2),
    200: const Color.fromRGBO(0, 217, 117, .3),
    300: const Color.fromRGBO(0, 217, 117, .4),
    400: const Color.fromRGBO(0, 217, 117, .5),
    500: const Color.fromRGBO(0, 217, 117, .6),
    600: const Color.fromRGBO(0, 217, 117, .7),
    700: const Color.fromRGBO(0, 217, 117, .8),
    800: const Color.fromRGBO(0, 217, 117, .9),
    900: const Color.fromRGBO(0, 217, 117, 1),
  };// Opacity 20%
}
