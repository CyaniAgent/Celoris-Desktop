import 'package:flutter/material.dart';
import 'dart:ui'; // For ImageFilter

class DockWidget extends StatelessWidget {
  const DockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Dock Configuration
    final double dockHeight = 80.0;
    final double dockBottomMargin = 16.0;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: dockBottomMargin),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: dockHeight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Hug content
                children: [
                  // Temporary PLACEHOLDER icons
                  _buildDockItem(context, Icons.apps, isActive: false),
                  const SizedBox(width: 16),
                  _buildDockItem(context, Icons.web, isActive: true),
                  const SizedBox(width: 16),
                  _buildDockItem(context, Icons.folder, isActive: false),
                  const SizedBox(width: 16),
                  _buildDockItem(context, Icons.terminal, isActive: false),
                  const SizedBox(width: 16),
                  _buildDockItem(context, Icons.settings, isActive: false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDockItem(
    BuildContext context,
    IconData icon, {
    bool isActive = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 32, color: Colors.white),
        if (isActive)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          )
        else
          const SizedBox(height: 8), // Spacer to keep alignment
      ],
    );
  }
}
