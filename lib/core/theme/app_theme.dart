import 'package:flutter/material.dart';
import 'color_schemes.dart';

/// The main theme configuration for Celoris Desktop.
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      fontFamily: 'Inter', // Ensuring we use the geometric sans
      scaffoldBackgroundColor: lightColorScheme.background,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: darkColorScheme.background,

      // Customize standard component themes here
      cardTheme: CardThemeData(
        color: AppColors.glassGrey.withOpacity(0.7),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
        ),
      ),
    );
  }
}
