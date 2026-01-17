import 'package:flutter/material.dart';

class StageWidget extends StatelessWidget {
  const StageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Stack(
        children: [
          // Wallpaper Layer
          Positioned.fill(
            child: Image.asset(
              'assets/images/demo-wallpaper.jpg',
              fit: BoxFit.cover,
              // Fallback placeholder while loading or if missing
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.grid_view_rounded,
                    size: 120,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.05),
                  ),
                );
              },
            ),
          ),

          // Window Layer will go here
        ],
      ),
    );
  }
}
