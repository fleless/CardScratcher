import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import 'app_bottom_navbar_theme.dart';
import 'app_fab_theme.dart';
import 'app_text_theme.dart';

/// This class allows for global overrides of material ThemeData
///
class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    primaryColor: Colors.white,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.titilliumWebTextTheme(AppTextTheme.textTheme),
    bottomAppBarTheme: AppBottomNavBarTheme.bottomAppBarTheme,
    floatingActionButtonTheme: AppFABTheme.fABTheme,
    iconTheme: const IconThemeData(),
    primarySwatch: MaterialColor(0xFF00D975, AppColors.colorCodes),
    accentColor: AppColors.green,
  );
}
