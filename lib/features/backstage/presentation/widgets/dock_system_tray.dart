import 'package:flutter/material.dart';
import '../../../../core/theme/glass_container.dart';

class DockSystemTray extends StatelessWidget {
  final VoidCallback? onTap;

  const DockSystemTray({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        borderRadius: BorderRadius.circular(24),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Background Apps Toggle
            IconButton(
              constraints: const BoxConstraints(maxWidth: 28, maxHeight: 28),
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_up_rounded,
                color: Colors.white,
                size: 18,
              ),
              tooltip: 'Show Hidden Icons',
            ),
            const VerticalDivider(
              color: Colors.white24,
              width: 12,
              indent: 14,
              endIndent: 14,
            ),
            // Network
            const Icon(Icons.wifi_rounded, color: Colors.white, size: 16),
            const SizedBox(width: 8),
            // Battery
            const Icon(
              Icons.battery_full_rounded,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(width: 8),
            // Time
            Text(
              "12:00", // Shorter time format
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    ); // Close GestureDetector
  }
}
