import 'package:flutter/material.dart';
import '../../../../core/theme/glass_container.dart';

class NotificationCenterWidget extends StatefulWidget {
  const NotificationCenterWidget({super.key});

  @override
  State<NotificationCenterWidget> createState() =>
      _NotificationCenterWidgetState();
}

class _NotificationCenterWidgetState extends State<NotificationCenterWidget> {
  // Mock State
  bool _isDndActive = false;

  // Mock Data
  final List<_MockNotification> _notifications = [
    _MockNotification(
      appName: 'YouTube',
      title: 'New Upload from Veritasium',
      body: 'The Man Who Accidentally Killed The Most People In History',
      time: '2m ago',
      icon: Icons.play_circle_fill_rounded,
      color: Colors.red,
    ),
    _MockNotification(
      appName: 'Spotify',
      title: 'Now Playing',
      body: 'DECO*27 - Salamander feat. Hatsune Miku',
      time: 'Now',
      icon: Icons.music_note_rounded,
      color: Colors.green,
      hasImage: true,
    ),
    _MockNotification(
      appName: 'Discord',
      title: 'Direct Message',
      body: 'Saki: Are we still rehearsing tonight?',
      time: '15m ago',
      icon: Icons.chat_bubble_rounded,
      color: Color(0xFF5865F2),
    ),
    _MockNotification(
      appName: 'Calendar',
      title: 'Upcoming Event',
      body: 'Project Celoris Weekly Sync',
      time: '30m ago',
      icon: Icons.calendar_today_rounded,
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: 360,
      borderRadius: BorderRadius.circular(24),
      padding: const EdgeInsets.all(0), // Custom padding for inner content
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notifications",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _notifications.clear();
                    });
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    "Clear all",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Notification List
          if (_notifications.isEmpty)
            SizedBox(
              height: 150,
              child: Center(
                child: Text(
                  "No new notifications",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white54),
                ),
              ),
            )
          else
            Container(
              constraints: const BoxConstraints(maxHeight: 320),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: _notifications
                      .map((n) => _buildNotificationCard(n))
                      .toList(),
                ),
              ),
            ),

          const Divider(height: 1, color: Colors.white10),

          // Footer (DND & Settings)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: _buildFooterToggle(
                    icon: _isDndActive
                        ? Icons.do_not_disturb_on_rounded
                        : Icons.do_not_disturb_off_rounded,
                    label: "Do Not Disturb",
                    isActive: _isDndActive,
                    onTap: () => setState(() => _isDndActive = !_isDndActive),
                  ),
                ),
                const SizedBox(width: 8),
                _buildSettingsButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(_MockNotification info) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: info.color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(info.icon, size: 16, color: info.color),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      info.appName,
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(color: Colors.white70),
                    ),
                    const Spacer(),
                    Text(
                      info.time,
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall?.copyWith(color: Colors.white38),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  info.title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  info.body,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.white70),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterToggle({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final color = isActive
        ? theme.colorScheme.primary
        : Colors.white.withOpacity(0.1);
    final onColor = isActive ? theme.colorScheme.onPrimary : Colors.white;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: color.withOpacity(
              isActive ? 1.0 : 0.5,
            ), // Transparent back if inactive
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: onColor),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: onColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.settings_rounded,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _MockNotification {
  final String appName;
  final String title;
  final String body;
  final String time;
  final IconData icon;
  final Color color;
  final bool hasImage;

  _MockNotification({
    required this.appName,
    required this.title,
    required this.body,
    required this.time,
    required this.icon,
    required this.color,
    this.hasImage = false,
  });
}
