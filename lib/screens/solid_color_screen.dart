import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Article {
  final String id;
  final String title;
  final String category;
  final String readTime;
  final String author;
  final String summary;
  bool isLiked;
  bool isBookmarked;

  Article({
    required this.id,
    required this.title,
    required this.category,
    required this.readTime,
    required this.author,
    required this.summary,
    this.isLiked = false,
    this.isBookmarked = false,
  });
}

class SolidColorScreen extends StatefulWidget {
  const SolidColorScreen({super.key});

  @override
  State<SolidColorScreen> createState() => _SolidColorScreenState();
}

class _SolidColorScreenState extends State<SolidColorScreen> {
  final List<Article> _articles = [
    Article(
      id: '1',
      title: 'Architecting Flutter Apps for Scale',
      category: 'Architecture',
      readTime: '8 min read',
      author: 'David Vance',
      summary: 'Learn clean architecture principles to build robust, scalable, and maintainable Flutter applications.',
    ),
    Article(
      id: '2',
      title: 'Deep Dive: Flutter Custom Painters',
      category: 'Design',
      readTime: '12 min read',
      author: 'Sophia Lin',
      summary: 'Master the Canvas API and custom painting techniques to create lightweight and complex customized UI components.',
    ),
    Article(
      id: '3',
      title: 'Understanding Dart Asynchronous Streams',
      category: 'Development',
      readTime: '6 min read',
      author: 'Marcus Aurel',
      summary: 'An in-depth guide on handling streams, stream controllers, and reactive design patterns in Dart.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: CurvedAppBar(
        shape: CurvedAppBarShape.rounded,
        curveRadius: 28,
        backgroundColor: const Color(0xFF1E3A8A), // Solid Cobalt Blue
        foregroundColor: Colors.white,
        title: const Text(
          'Tech Journal',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        subtitle: const Text('Solid Color Curved App Bar Demo'),
        backButton: IconButton.filledTonal(
          onPressed: () => Navigator.of(context).maybePop(),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Iconsax.arrow_left_2, size: 16),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemCount: _articles.length,
        itemBuilder: (context, index) {
          final article = _articles[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 8,
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
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E3A8A).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        article.category.toUpperCase(),
                        style: const TextStyle(
                          color: Color(0xFF1E3A8A),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    Text(
                      article.readTime,
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  article.summary,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Iconsax.user, size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      article.author,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        article.isLiked ? Iconsax.heart5 : Iconsax.heart,
                        color: article.isLiked ? Colors.redAccent : Colors.grey,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          article.isLiked = !article.isLiked;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        article.isBookmarked ? Iconsax.archive_1 : Iconsax.archive,
                        color: article.isBookmarked ? Colors.blue : Colors.grey,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          article.isBookmarked = !article.isBookmarked;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
