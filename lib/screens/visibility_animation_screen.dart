import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class VisibilityAnimationScreen extends StatefulWidget {
  const VisibilityAnimationScreen({super.key});

  @override
  State<VisibilityAnimationScreen> createState() => _VisibilityAnimationScreenState();
}

class _VisibilityAnimationScreenState extends State<VisibilityAnimationScreen> {
  bool _isVisible = true;
  bool _animate = true;
  double _durationMs = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFD),
      appBar: CurvedAppBar(
        visible: _isVisible,
        animate: _animate,
        animationDuration: Duration(milliseconds: _durationMs.toInt()),
        shape: CurvedAppBarShape.rounded,
        curveRadius: 28,
        backgroundColor: const Color(0xFF4F46E5), // Indigo 600
        foregroundColor: Colors.white,
        title: const Text(
          'eBook Reader',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        subtitle: const Text('Visibility & Animation Demo'),
        backButton: IconButton.filledTonal(
          onPressed: () => Navigator.of(context).maybePop(),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Iconsax.arrow_left_2, size: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Control Panel
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.01),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CONTROLLER CONTROLS',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: Colors.grey, letterSpacing: 1.0),
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    title: const Text('AppBar Visible', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: const Text('Toggle preferred app bar visibility'),
                    value: _isVisible,
                    activeColor: const Color(0xFF4F46E5),
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      setState(() {
                        _isVisible = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Animate Transition', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: const Text('Slide & fade in/out animations'),
                    value: _animate,
                    activeColor: const Color(0xFF4F46E5),
                    contentPadding: EdgeInsets.zero,
                    onChanged: (val) {
                      setState(() {
                        _animate = val;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Animation Duration',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        '${_durationMs.toInt()} ms',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4F46E5)),
                      ),
                    ],
                  ),
                  Slider(
                    value: _durationMs,
                    min: 100.0,
                    max: 1000.0,
                    activeColor: const Color(0xFF4F46E5),
                    onChanged: (val) {
                      setState(() {
                        _durationMs = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Reader Content
            const Text(
              'Chapter 1: The Design Blueprint',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 16),
            const Text(
              'A well-designed app bar acts as the navigation anchor for mobile application layouts. '
              'By introducing smooth curved clips and shapes, we break the blocky visual structure of traditional flat screens, '
              'creating organic transitions that direct the user\'s attention smoothly onto lists and grid contents.\n\n'
              'When extending the body behind the app bar, layout paddings must be resolved with care to ensure text '
              'and controls remain within hit-testing boundaries. Using the CurvedBody layout spacer helper resolves '
              'excess top space gaps automatically while keeping default list views clear of safe area issues.\n\n'
              'Toggle the settings above to see how curved_app_bar manages collapsed heights and slides into place instantly.',
              style: TextStyle(fontSize: 15, color: Color(0xFF334155), height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
