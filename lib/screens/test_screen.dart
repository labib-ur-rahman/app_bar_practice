import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CurvedAppBar(
        title: const Text('Dashboard'),
        backgroundGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFfc00ff), Color(0xFF00dbde)],
        ),
      ),
      body: CurvedBody(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: _colors.length,
          itemBuilder: (context, index) {
            final color = _colors[index];
            return Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  final List<Color> _colors = const [
    Color(0xFFF43F5E), // Rose 500
    Color(0xFFEC4899), // Pink 500
    Color(0xFFD946EF), // Fuchsia 500
    Color(0xFFA855F7), // Purple 500
    Color(0xFF8B5CF6), // Violet 500
    Color(0xFF6366F1), // Indigo 500
    Color(0xFF3B82F6), // Blue 500
    Color(0xFF0EA5E9), // Light Blue 500
    Color(0xFF06B6D4), // Cyan 500
    Color(0xFF14B8A6), // Teal 500
    Color(0xFF10B981), // Emerald 500
    Color(0xFF22C55E), // Green 500
    Color(0xFF84CC16), // Lime 500
    Color(0xFFEAB308), // Yellow 500
    Color(0xFFF97316), // Orange 500
    Color(0xFFEF4444), // Red 500
    Color(0xFF78716C), // Stone 500
    Color(0xFF64748B), // Slate 500
    Color(0xFFF43F5E), // Rose 500
    Color(0xFFEC4899), // Pink 500
    Color(0xFFD946EF), // Fuchsia 500
    Color(0xFFA855F7), // Purple 500
    Color(0xFF8B5CF6), // Violet 500
    Color(0xFF6366F1), // Indigo 500
    Color(0xFF3B82F6), // Blue 500
    Color(0xFF0EA5E9), // Light Blue 500
    Color(0xFF06B6D4), // Cyan 500
    Color(0xFF14B8A6), // Teal 500
    Color(0xFF10B981), // Emerald 500
    Color(0xFF22C55E), // Green 500
    Color(0xFF84CC16), // Lime 500
    Color(0xFFEAB308), // Yellow 500
    Color(0xFFF97316), // Orange 500
    Color(0xFFEF4444), // Red 500
    Color(0xFF78716C), // Stone 500
    Color(0xFF64748B), // Slate 500
  ];
}
