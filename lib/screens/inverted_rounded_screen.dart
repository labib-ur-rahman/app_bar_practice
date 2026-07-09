import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Workout {
  final String title;
  final String duration;
  final String calories;
  bool isCompleted;

  Workout({
    required this.title,
    required this.duration,
    required this.calories,
    this.isCompleted = false,
  });
}

class InvertedRoundedScreen extends StatefulWidget {
  const InvertedRoundedScreen({super.key});

  @override
  State<InvertedRoundedScreen> createState() => _InvertedRoundedScreenState();
}

class _InvertedRoundedScreenState extends State<InvertedRoundedScreen> {
  final List<Workout> _workouts = [
    Workout(title: 'HIIT Cardio Burst', duration: '20 mins', calories: '250 kcal'),
    Workout(title: 'Upper Body Dumbbells', duration: '30 mins', calories: '180 kcal'),
    Workout(title: 'Core Strength Routine', duration: '15 mins', calories: '110 kcal'),
    Workout(title: 'Cool Down Yoga Stretch', duration: '10 mins', calories: '45 kcal'),
  ];

  int _steps = 6420;

  void _completeWorkout(int index) {
    setState(() {
      _workouts[index].isCompleted = !_workouts[index].isCompleted;
      if (_workouts[index].isCompleted) {
        _steps += 850; // Add steps on workout complete!
      } else {
        _steps -= 850;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double appBarHeight = statusBarHeight + kToolbarHeight + 42;

    int totalCalories = 0;
    for (var w in _workouts) {
      if (w.isCompleted) {
        final val = int.tryParse(w.calories.split(' ')[0]) ?? 0;
        totalCalories += val;
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFAFBFD),
      appBar: CurvedAppBar(
        shape: CurvedAppBarShape.invertedRounded,
        curveRadius: 42,
        backgroundColor: const Color(0xFFEA580C), // Orange 600
        foregroundColor: Colors.white,
        title: const Text(
          'Fitness Hub',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        subtitle: const Text('Inverted Rounded Shape Demo'),
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
        padding: EdgeInsets.fromLTRB(16, appBarHeight + 16, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Premium Stats Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFF1F5F9)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFEA580C).withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Iconsax.flash, color: Color(0xFFEA580C), size: 18),
                            const SizedBox(width: 6),
                            Text(
                              'DAILY GOAL',
                              style: TextStyle(color: Colors.grey[500], fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '$_steps Steps',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                        ),
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: (_steps / 10000).clamp(0.0, 1.0),
                            backgroundColor: Colors.grey[100],
                            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFEA580C)),
                            minHeight: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEA580C).withOpacity(0.08),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Iconsax.activity, color: Color(0xFFEA580C), size: 24),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$totalCalories kcal',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const Text(
                        'Burned Today',
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 12),
              child: Text(
                'EXERCISE LIST',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: _workouts.length,
              itemBuilder: (context, index) {
                final workout = _workouts[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFF1F5F9)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.01),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    leading: Checkbox(
                      value: workout.isCompleted,
                      activeColor: const Color(0xFFEA580C),
                      onChanged: (val) => _completeWorkout(index),
                    ),
                    title: Text(
                      workout.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: workout.isCompleted ? Colors.grey : const Color(0xFF0F172A),
                        decoration: workout.isCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Row(
                        children: [
                          Icon(Iconsax.timer, size: 14, color: Colors.grey[500]),
                          const SizedBox(width: 4),
                          Text(workout.duration, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                          const SizedBox(width: 16),
                          Icon(Iconsax.flash, size: 14, color: Colors.grey[500]),
                          const SizedBox(width: 4),
                          Text(workout.calories, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
