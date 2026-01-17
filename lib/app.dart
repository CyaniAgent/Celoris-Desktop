import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/stage/presentation/desktop_scaffold.dart';

class CelorisApp extends StatelessWidget {
  const CelorisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Celoris Desktop',
      debugShowCheckedModeBanner: false,

      // Theme Configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark, // Enforce Dark Mode for now

      home: const DesktopScaffold(),
    );
  }
}
