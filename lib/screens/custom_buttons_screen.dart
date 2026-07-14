import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Appliance {
  final String name;
  final IconData icon;
  bool isOn;
  double level; // for dimmer/temperature/volume

  Appliance({
    required this.name,
    required this.icon,
    this.isOn = false,
    this.level = 0.5,
  });
}

class CustomButtonsScreen extends StatefulWidget {
  const CustomButtonsScreen({super.key});

  @override
  State<CustomButtonsScreen> createState() => _CustomButtonsScreenState();
}

class _CustomButtonsScreenState extends State<CustomButtonsScreen> {
  final List<Appliance> _appliances = [
    Appliance(
      name: 'Ceiling Lamp',
      icon: Iconsax.lamp_on,
      isOn: true,
      level: 0.8,
    ),
    Appliance(
      name: 'Living AC',
      icon: Iconsax.wind,
      isOn: false,
      level: 0.22,
    ), // 22 degrees
    Appliance(
      name: 'Smart TV',
      icon: Iconsax.monitor,
      isOn: true,
      level: 0.3,
    ), // 30% volume
    Appliance(
      name: 'Sound System',
      icon: Iconsax.volume_high,
      isOn: false,
      level: 0.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      // Scaffold has a drawer so we can show drawer button behavior
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF0F172A)),
              child: Text(
                'Smart Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Iconsax.home),
              title: const Text('Home Dashboard'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: CurvedAppBar(
        shape: CurvedAppBarShape.invertedRounded,
        curveRadius: 30,
        backgroundColor: const Color(0xFF0F172A), // Slate 900
        foregroundColor: Colors.white,
        title: const Text(
          'Smart Home',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        // subtitle: const Text('Custom Back & Drawer Buttons Demo'),
        automaticallyImplyLeading: true,
        // Override back button with a beautiful glass-like border button
        backButton: IconButton.filledTonal(
          onPressed: () => Navigator.of(context).maybePop(),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.12),
            foregroundColor: Colors.white,
            side: BorderSide(color: Colors.white.withOpacity(0.15)),
          ),
          icon: const Icon(Iconsax.arrow_left_2, size: 16),
        ),
        // Custom Drawer button shown if Drawer is active
        drawerButton: Builder(
          builder: (context) {
            return IconButton.filledTonal(
              onPressed: () => Scaffold.of(context).openDrawer(),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.12),
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white.withOpacity(0.15)),
              ),
              icon: const Icon(Iconsax.menu, size: 18),
            );
          },
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: _appliances.length,
        itemBuilder: (context, index) {
          final appliance = _appliances[index];
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: appliance.isOn
                    ? const Color(0xFF38BDF8).withOpacity(0.3)
                    : const Color(0xFFE2E8F0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: appliance.isOn
                            ? const Color(0xFF38BDF8).withOpacity(0.1)
                            : Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        appliance.icon,
                        color: appliance.isOn
                            ? const Color(0xFF0EA5E9)
                            : Colors.grey[500],
                        size: 24,
                      ),
                    ),
                    Switch(
                      value: appliance.isOn,
                      activeColor: const Color(0xFF0EA5E9),
                      onChanged: (val) {
                        setState(() {
                          appliance.isOn = val;
                        });
                      },
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  appliance.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  appliance.isOn
                      ? (appliance.name == 'Living AC'
                            ? '${(appliance.level * 10 + 16).toInt()}°C'
                            : '${(appliance.level * 100).toInt()}% Intensity')
                      : 'Off',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                if (appliance.isOn)
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 3,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 6,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 12,
                      ),
                    ),
                    child: Slider(
                      value: appliance.level,
                      activeColor: const Color(0xFF0EA5E9),
                      onChanged: (val) {
                        setState(() {
                          appliance.level = val;
                        });
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ).withCurvedBody(),
    );
  }
}
