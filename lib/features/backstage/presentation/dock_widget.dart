import 'package:flutter/material.dart';
import 'widgets/dock_interaction_panel.dart';
import 'widgets/dock_app_rack.dart';
import 'widgets/dock_system_tray.dart';

class DockWidget extends StatelessWidget {
  final VoidCallback? onTrayTap;
  final VoidCallback? onInteractionTap;

  const DockWidget({super.key, this.onTrayTap, this.onInteractionTap});

  @override
  Widget build(BuildContext context) {
    // Dock Configuration
    final double dockBottomMargin = 12.0;

    return Padding(
      padding: EdgeInsets.only(bottom: dockBottomMargin, left: 12, right: 12),
      child: Stack(
        children: [
          // Left: Interaction / Dynamic Island
          Align(
            alignment: Alignment.bottomLeft,
            child: DockInteractionPanel(onTap: onInteractionTap),
          ),

          // Center: App Rack
          const Align(alignment: Alignment.bottomCenter, child: DockAppRack()),

          // Right: System Tray
          Align(
            alignment: Alignment.bottomRight,
            child: DockSystemTray(onTap: onTrayTap),
          ),
        ],
      ),
    );
  }
}
