import 'package:flutter/material.dart';
import '../../../../core/theme/glass_container.dart';

class ControlCenterWidget extends StatefulWidget {
  const ControlCenterWidget({super.key});

  @override
  State<ControlCenterWidget> createState() => _ControlCenterWidgetState();
}

class _ControlCenterWidgetState extends State<ControlCenterWidget> {
  // Mock State
  bool _isWifiOn = true;
  bool _isBluetoothOn = true;
  bool _isDndOn = false;
  bool _isDarkModeOn = true;
  bool _isCastOn = false;
  bool _isVpnOn = false;

  double _brightness = 0.7;
  double _volume = 0.5;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: 320, // Slightly narrower to be more compact
      padding: const EdgeInsets.all(12),
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Quick Toggles Grid (2x2 Big Toggles)
          Row(
            children: [
              _buildLargeToggle(
                icon: Icons.wifi_rounded,
                label: "Wi-Fi",
                subLabel: _isWifiOn ? "Celoris_5G" : "Off",
                isActive: _isWifiOn,
                onTap: () => setState(() => _isWifiOn = !_isWifiOn),
              ),
              const SizedBox(width: 8),
              _buildLargeToggle(
                icon: Icons.bluetooth_rounded,
                label: "Bluetooth",
                subLabel: _isBluetoothOn ? "On" : "Off",
                isActive: _isBluetoothOn,
                onTap: () => setState(() => _isBluetoothOn = !_isBluetoothOn),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // 2. Small Toggles Row
          Row(
            children: [
              _buildSmallToggle(
                icon: _isDndOn
                    ? Icons.do_not_disturb_on_rounded
                    : Icons.do_not_disturb_off_rounded,
                isActive: _isDndOn,
                onTap: () => setState(() => _isDndOn = !_isDndOn),
                tooltip: "Do Not Disturb",
              ),
              const SizedBox(width: 8),
              _buildSmallToggle(
                icon: _isDarkModeOn
                    ? Icons.dark_mode_rounded
                    : Icons.light_mode_rounded,
                isActive: _isDarkModeOn,
                onTap: () => setState(() => _isDarkModeOn = !_isDarkModeOn),
                tooltip: "Dark Mode",
              ),
              const SizedBox(width: 8),
              _buildSmallToggle(
                icon: Icons.cast_rounded,
                isActive: _isCastOn,
                onTap: () => setState(() => _isCastOn = !_isCastOn),
                tooltip: "Cast",
              ),
              const SizedBox(width: 8),
              _buildSmallToggle(
                icon: Icons.vpn_key_rounded,
                isActive: _isVpnOn,
                onTap: () => setState(() => _isVpnOn = !_isVpnOn),
                tooltip: "VPN",
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 3. Sliders
          _buildSliderRow(
            icon: Icons.brightness_6_rounded,
            value: _brightness,
            onChanged: (v) => setState(() => _brightness = v),
          ),
          const SizedBox(height: 8),
          _buildSliderRow(
            icon: _volume == 0
                ? Icons.volume_off_rounded
                : Icons.volume_up_rounded,
            value: _volume,
            onChanged: (v) => setState(() => _volume = v),
          ),

          const SizedBox(height: 16),

          // 4. Footer (Power / Settings)
          Row(
            children: [
              _buildFooterButton(
                Icons.power_settings_new_rounded,
                Colors.redAccent,
              ),
              const Spacer(),
              _buildFooterButton(Icons.lock_rounded, null),
              const SizedBox(width: 8),
              _buildFooterButton(Icons.settings_rounded, null),
              const SizedBox(width: 8),
              // Collapse Button
              InkWell(
                onTap: () {
                  // Logic handled by parent closing overlay
                },
                borderRadius: BorderRadius.circular(12),
                child: const Icon(
                  Icons.expand_more_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLargeToggle({
    required IconData icon,
    required String label,
    required String subLabel,
    bool isActive = false,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final color = isActive
        ? theme.colorScheme.primary
        : theme.colorScheme.surface;
    final onColor = isActive ? theme.colorScheme.onPrimary : Colors.white;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 76,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: color.withOpacity(isActive ? 1.0 : 0.5),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.05),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: onColor, size: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: onColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      subLabel,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: onColor.withOpacity(0.7),
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSmallToggle({
    required IconData icon,
    bool isActive = false,
    required VoidCallback onTap,
    String? tooltip,
  }) {
    final theme = Theme.of(context);
    final color = isActive
        ? theme.colorScheme.primary
        : theme.colorScheme.surface;
    final onColor = isActive ? theme.colorScheme.onPrimary : Colors.white;

    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(30), // Circle
            child: Tooltip(
              message: tooltip ?? "",
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: color.withOpacity(isActive ? 1.0 : 0.5),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.05),
                    width: 1,
                  ),
                ),
                child: Icon(icon, color: onColor, size: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliderRow({
    required IconData icon,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 32,
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 6,
                activeTrackColor: Theme.of(context).colorScheme.primary,
                inactiveTrackColor: Colors.white12,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 0,
                ), // Hidden thumb for sleek look
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
                trackShape: _CustomTrackShape(),
              ),
              child: Slider(value: value, onChanged: onChanged),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooterButton(IconData icon, Color? color) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color ?? Colors.white, size: 18),
        ),
      ),
    );
  }
}

class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
