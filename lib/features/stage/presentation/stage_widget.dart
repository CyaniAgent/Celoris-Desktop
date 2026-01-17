import 'package:flutter/material.dart';

class StageWidget extends StatelessWidget {
  const StageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // For now, we just show a solid color background (Void Black)
    // Later, this will handle Wallpapers and the Icon Grid.
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Stack(
        children: [
          // Wallpaper Layer (Placeholder)
          Positioned.fill(
            child: Center(
              child: Icon(
                Icons.grid_view_rounded,
                size: 120,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
              ),
            ),
          ),

          // Window Layer will go here
        ],
      ),
    );
  }
}
