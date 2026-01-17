import 'package:flutter/material.dart';
import '../../backstage/presentation/dock_widget.dart';
import 'stage_widget.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // We extend the body behind the keyboard/safe-area equivalent
      // to ensure full-screen immersion.
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: const [
          // 1. Bottom Layer: Stage (Desktop Background & Icons)
          Positioned.fill(child: StageWidget()),

          // 2. Middle Layer: Window Manager (Spotlight) will go here
          // ...

          // 3. Top Layer: System Overlays (Dock, Launcher, Notifications)
          // For now, just the Dock.
          DockWidget(),
        ],
      ),
    );
  }
}
