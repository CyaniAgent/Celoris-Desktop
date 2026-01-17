import 'package:flutter/material.dart';
import '../../../../core/theme/glass_container.dart';

class DockInteractionPanel extends StatelessWidget {
  final VoidCallback? onTap;

  const DockInteractionPanel({super.key, this.onTap});

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
            IconButton(
              constraints: const BoxConstraints(maxWidth: 32, maxHeight: 32),
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 20,
              ),
              tooltip: 'Notifications',
            ),
            const SizedBox(width: 4),
            // Dynamic Island Placeholder Text
            Text(
              "Celoris Dynamic Island Test",
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.white70,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
