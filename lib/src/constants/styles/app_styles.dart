import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// This class provides custom styles to be used in the project.
///
class AppStyles {
  AppStyles._();

  static const TextStyle materialButtonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 12,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w700,
  );

  static const subTitleTextStyle = TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 22,
    height: 1.1,
  );

  static const fieldLabelStyle = TextStyle(
    fontFamily: 'Neusa Next Std',
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

}
