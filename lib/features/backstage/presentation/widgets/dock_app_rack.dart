import 'package:flutter/material.dart';
import '../../../../core/theme/glass_container.dart';

class DockAppRack extends StatelessWidget {
  const DockAppRack({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      borderRadius: BorderRadius.circular(24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Launcher
          _buildDockItem(context, Icons.apps_rounded, isActive: false),
          const SizedBox(width: 12),
          // Browser
          _buildDockItem(context, Icons.public, isActive: true),
          const SizedBox(width: 12),
          // Files
          _buildDockItem(context, Icons.folder_open_rounded, isActive: false),
          const SizedBox(width: 12),
          // Terminal
          _buildDockItem(context, Icons.terminal_rounded, isActive: false),
          const SizedBox(width: 12),
          // Settings
          _buildDockItem(context, Icons.settings_rounded, isActive: false),
        ],
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
        Icon(
          icon,
          size: 22, // Reduced size
          color: Colors.white,
        ),
        if (isActive)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              width: 3,
              height: 3,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          )
        else
          const SizedBox(height: 5), // Spacer
      ],
    );
  }
}
