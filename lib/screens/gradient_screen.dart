import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Track {
  final String id;
  final String title;
  final String artist;
  final String duration;
  bool isPlaying;
  bool isFavorite;

  Track({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    this.isPlaying = false,
    this.isFavorite = false,
  });
}

class GradientScreen extends StatefulWidget {
  const GradientScreen({super.key});

  @override
  State<GradientScreen> createState() => _GradientScreenState();
}

class _GradientScreenState extends State<GradientScreen> {
  final List<Track> _playlist = [
    Track(id: '1', title: 'Sunset Boulevard', artist: 'Neon Horizon', duration: '3:45'),
    Track(id: '2', title: 'Cybernetic Love', artist: 'Retro Future', duration: '4:12'),
    Track(id: '3', title: 'Synthwave Dreams', artist: 'Star Traveler', duration: '3:58'),
    Track(id: '4', title: 'Midnight Drive', artist: 'Grid Runner', duration: '5:02'),
    Track(id: '5', title: 'Electric Echoes', artist: 'Pixel Symphony', duration: '3:20'),
  ];

  void _togglePlay(int index) {
    setState(() {
      for (int i = 0; i < _playlist.length; i++) {
        if (i == index) {
          _playlist[i].isPlaying = !_playlist[i].isPlaying;
        } else {
          _playlist[i].isPlaying = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeTrackIndex = _playlist.indexWhere((track) => track.isPlaying);
    final activeTrack = activeTrackIndex != -1 ? _playlist[activeTrackIndex] : null;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0C1B), // Dark cyber theme
      appBar: CurvedAppBar(
        shape: CurvedAppBarShape.rounded,
        curveRadius: 32,
        title: const Text(
          'Synth Playlist',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        subtitle: const Text(
          'LinearGradient Curved App Bar Demo',
          style: TextStyle(color: Colors.white70),
        ),
        foregroundColor: Colors.white,
        backgroundGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF8B5CF6), // Violet 500
            Color(0xFFEC4899), // Pink 500
          ],
        ),
        backButton: IconButton.filledTonal(
          onPressed: () => Navigator.of(context).maybePop(),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Iconsax.arrow_left_2, size: 16),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              itemCount: _playlist.length,
              itemBuilder: (context, index) {
                final track = _playlist[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: track.isPlaying ? const Color(0xFF1E1736) : const Color(0xFF171226),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: track.isPlaying ? const Color(0xFFEC4899).withOpacity(0.3) : const Color(0xFF26213D),
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: track.isPlaying ? const Color(0xFFEC4899).withOpacity(0.1) : const Color(0xFF26213D),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Iconsax.music,
                        color: track.isPlaying ? const Color(0xFFEC4899) : Colors.white60,
                        size: 20,
                      ),
                    ),
                    title: Text(
                      track.title,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Text(
                      track.artist,
                      style: const TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          track.duration,
                          style: const TextStyle(color: Colors.white30, fontSize: 13),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: Icon(
                            track.isFavorite ? Iconsax.heart5 : Iconsax.heart,
                            color: track.isFavorite ? const Color(0xFFEC4899) : Colors.white30,
                            size: 18,
                          ),
                          onPressed: () {
                            setState(() {
                              track.isFavorite = !track.isFavorite;
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            track.isPlaying ? Iconsax.pause : Iconsax.play,
                            color: track.isPlaying ? const Color(0xFF8B5CF6) : Colors.white,
                            size: 18,
                          ),
                          onPressed: () => _togglePlay(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (activeTrack != null)
            SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF171226),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  border: Border(top: BorderSide(color: Color(0xFF26213D))),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFF8B5CF6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Iconsax.music, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            activeTrack.title,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            activeTrack.artist,
                            style: const TextStyle(color: Colors.white60, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Iconsax.pause, color: Colors.white, size: 22),
                      onPressed: () {
                        setState(() {
                          activeTrack.isPlaying = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
