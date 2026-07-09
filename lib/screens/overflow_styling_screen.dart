import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class PhotoItem {
  final String imageUrl;
  final String category;

  const PhotoItem({
    required this.imageUrl,
    required this.category,
  });
}

class OverflowStylingScreen extends StatefulWidget {
  const OverflowStylingScreen({super.key});

  @override
  State<OverflowStylingScreen> createState() => _OverflowStylingScreenState();
}

class _OverflowStylingScreenState extends State<OverflowStylingScreen> {
  final List<PhotoItem> _photos = const [
    PhotoItem(imageUrl: 'https://images.unsplash.com/photo-1501854140801-50d01698950b?auto=format&fit=crop&w=300&q=80', category: 'Nature'),
    PhotoItem(imageUrl: 'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?auto=format&fit=crop&w=300&q=80', category: 'City'),
    PhotoItem(imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=300&q=80', category: 'People'),
    PhotoItem(imageUrl: 'https://images.unsplash.com/photo-1541701494587-cb58502866ab?auto=format&fit=crop&w=300&q=80', category: 'Abstract'),
    PhotoItem(imageUrl: 'https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?auto=format&fit=crop&w=300&q=80', category: 'Nature'),
    PhotoItem(imageUrl: 'https://images.unsplash.com/photo-1449034446853-66c86144b0ad?auto=format&fit=crop&w=300&q=80', category: 'City'),
  ];

  String _filterCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredPhotos = _filterCategory == 'All'
        ? _photos
        : _photos.where((photo) => photo.category == _filterCategory).toList();

    final categories = ['All', 'Nature', 'City', 'People', 'Abstract'];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFD),
      appBar: CurvedAppBar(
        shape: CurvedAppBarShape.rounded,
        curveRadius: 28,
        backgroundColor: const Color(0xFF1E293B), // Dark slate
        foregroundColor: Colors.white,
        title: const Text(
          'Photo Vault',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        subtitle: const Text('Overflow Styling Showcase'),
        backButton: IconButton.filledTonal(
          onPressed: () => Navigator.of(context).maybePop(),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Iconsax.arrow_left_2, size: 16),
        ),
        maxVisibleActionItems: 1,
        // Overflow popup menu styling configuration
        overflowMenuColor: const Color(0xFF0F172A), // Dark slate popup body
        overflowMenuIconColor: Colors.white70,
        overflowMenuTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
        actionItems: [
          CurvedAppBarAction(
            label: 'Grid View',
            icon: Iconsax.gallery,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Grid mode active')),
              );
            },
          ),
          CurvedAppBarAction(
            label: 'Import Photo',
            icon: Iconsax.document_upload,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Importing photo...')),
              );
            },
          ),
          CurvedAppBarAction(
            label: 'Album Settings',
            icon: Iconsax.setting,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Album settings opened')),
              );
            },
          ),
          CurvedAppBarAction(
            label: 'Delete Album',
            icon: Iconsax.trash,
            // Styling this action individually to alert user
            menuIconColor: Colors.redAccent,
            menuTextStyle: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Album deleted successfully')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = cat == _filterCategory;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(cat),
                    selected: isSelected,
                    checkmarkColor: Colors.white,
                    selectedColor: const Color(0xFF1E293B),
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        _filterCategory = cat;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: filteredPhotos.length,
              itemBuilder: (context, index) {
                final photo = filteredPhotos[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          photo.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: const Icon(Iconsax.gallery, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          photo.category,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
