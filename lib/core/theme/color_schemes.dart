import 'package:flutter/material.dart';

/// The core color palette for Celoris Desktop.
/// Based on the "Miku-Saki" palette defined in `DESIGN_GUIDE.md`.
class AppColors {
  // Brand Colors
  static const Color cyaniteTeal = Color(0xFF39C5BB); // Hatsune Miku
  static const Color hanamiPink = Color(0xFFFF4081); // Saki Hanami

  // Backgrounds
  static const Color voidBlack = Color(0xFF121212);
  static const Color glassGrey = Color(0xFF1E1E1E);

  // Semantic
  static const Color error = Color(0xFFCF6679);
  static const Color success = Color(0xFF00E676);
  static const Color warning = Color(0xFFFFD740);
}

/// The Light Color Scheme.
/// Note: Celoris is primarily Dark Mode, but we provide a Light fallback.
const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.cyaniteTeal,
  onPrimary: Colors.white,
  secondary: AppColors.hanamiPink,
  onSecondary: Colors.white,
  error: AppColors.error,
  onError: Colors.white,
  background: Colors.white,
  onBackground: AppColors.voidBlack,
  surface: Color(0xFFF5F5F5),
  onSurface: AppColors.voidBlack,
);

/// The Dark Color Scheme (Default).
const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.cyaniteTeal,
  onPrimary: Colors.black,
  secondary: AppColors.hanamiPink,
  onSecondary: Colors.white,
  error: AppColors.error,
  onError: Colors.black,
  background: AppColors.voidBlack,
  onBackground: Colors.white,
  surface: AppColors.glassGrey,
  onSurface: Colors.white,
);
