import 'package:flutter/material.dart';
import '../../backstage/presentation/dock_widget.dart';
import '../../backstage/presentation/widgets/control_center_widget.dart';
import '../../backstage/presentation/widgets/notification_center_widget.dart';
import 'stage_widget.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  bool _isControlCenterOpen = false;
  bool _isNotificationCenterOpen = false;

  void _toggleControlCenter() {
    setState(() {
      _isControlCenterOpen = !_isControlCenterOpen;
      if (_isControlCenterOpen)
        _isNotificationCenterOpen = false; // Close others
    });
  }

  void _toggleNotificationCenter() {
    setState(() {
      _isNotificationCenterOpen = !_isNotificationCenterOpen;
      if (_isNotificationCenterOpen)
        _isControlCenterOpen = false; // Close others
    });
  }

  void _closeOverlays() {
    if (_isControlCenterOpen || _isNotificationCenterOpen) {
      setState(() {
        _isControlCenterOpen = false;
        _isNotificationCenterOpen = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // 1. Stage (Background)
          // Tapping stage closes overlays
          GestureDetector(
            onTap: _closeOverlays,
            behavior: HitTestBehavior.translucent,
            child: const SizedBox.expand(child: StageWidget()),
          ),

          // 2. Windows Layer (Placeholder)

          // 3. Dock Layer
          DockWidget(
            onTrayTap: _toggleControlCenter,
            onInteractionTap: _toggleNotificationCenter,
          ),

          // 4. Notification Center Overlay (Left)
          if (_isNotificationCenterOpen)
            Positioned(
              bottom: 48 + 12 + 12, // Dock Height + Margin + Spacing
              left: 12, // Aligned with Interaction Panel
              child: const NotificationCenterWidget(),
            ),

          // 5. Control Center Overlay (Right)
          if (_isControlCenterOpen)
            Positioned(
              bottom: 48 + 12 + 12, // Dock Height + Margin + Spacing
              right: 12, // Aligned with System Tray
              child: const ControlCenterWidget(),
            ),
        ],
      ),
    );
  }
}
