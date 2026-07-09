import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TravelDestination {
  final String name;
  final String imageUrl;
  final String location;
  final double rating;
  final double price;
  final String category;
  final String description;

  const TravelDestination({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.rating,
    required this.price,
    required this.category,
    required this.description,
  });
}

class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key});

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  final List<TravelDestination> _destinations = const [
    TravelDestination(
      name: 'Santorini Sunset Caldera',
      imageUrl: 'https://images.unsplash.com/photo-1570077188670-e3a8d69ac5ff?auto=format&fit=crop&w=600&q=80',
      location: 'Santorini, Greece',
      rating: 4.9,
      price: 240,
      category: 'Beaches',
      description: 'Experience the stunning whitewashed buildings, blue domes, and breathtaking Aegean Sea views.',
    ),
    TravelDestination(
      name: 'Mount Fuji Snowy Peak',
      imageUrl: 'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?auto=format&fit=crop&w=600&q=80',
      location: 'Honshu, Japan',
      rating: 4.8,
      price: 180,
      category: 'Mountains',
      description: 'An iconic active volcano famous for its symmetrical snow-capped peak and scenic cherry blossom views.',
    ),
    TravelDestination(
      name: 'Amalfi Coast Paradise',
      imageUrl: 'https://images.unsplash.com/photo-1533900298318-6b8da08a523e?auto=format&fit=crop&w=600&q=80',
      location: 'Salerno, Italy',
      rating: 4.7,
      price: 310,
      category: 'Beaches',
      description: 'A 50-kilometer stretch of coastline along the southern edge of Italy\'s Sorrentine Peninsula.',
    ),
    TravelDestination(
      name: 'Swiss Alps Ski Resort',
      imageUrl: 'https://images.unsplash.com/photo-1502784444187-359ac186c5bb?auto=format&fit=crop&w=600&q=80',
      location: 'Zermatt, Switzerland',
      rating: 4.9,
      price: 450,
      category: 'Mountains',
      description: 'Soar through high mountain peaks, crystal-clear glacier lakes, and luxury Alpine ski valleys.',
    ),
    TravelDestination(
      name: 'Kyoto Bamboo Forest',
      imageUrl: 'https://images.unsplash.com/photo-1503899036084-c55cdd92da26?auto=format&fit=crop&w=600&q=80',
      location: 'Kyoto, Japan',
      rating: 4.6,
      price: 120,
      category: 'Forests',
      description: 'Walk through towering green stalks of bamboo rustling in the wind, a peaceful spiritual retreat.',
    ),
    TravelDestination(
      name: 'New York City Lights',
      imageUrl: 'https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?auto=format&fit=crop&w=600&q=80',
      location: 'New York, USA',
      rating: 4.5,
      price: 290,
      category: 'Cities',
      description: 'The city that never sleeps. Bright billboard lights, skyscrapers, and rich Broadway culture.',
    ),
  ];

  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredDestinations = _selectedCategory == 'All'
        ? _destinations
        : _destinations.where((d) => d.category == _selectedCategory).toList();

    final categories = ['All', 'Beaches', 'Mountains', 'Forests', 'Cities'];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFD),
      appBar: CurvedAppBar(
        shape: CurvedAppBarShape.rounded,
        curveRadius: 36,
        title: const Text(
          'Explore Places',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 0.5),
        ),
        subtitle: const Text('Discover your next vacation spot'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        subtitleTextStyle: const TextStyle(color: Colors.white70, fontSize: 13),
        backgroundGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F766E), // Teal 700
            Color(0xFF115E59), // Teal 800
          ],
        ),
        foregroundColor: Colors.white,
        maxVisibleActionItems: 2,
        actionItems: [
          CurvedAppBarAction(
            label: 'Search',
            icon: Iconsax.search_normal_1,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Search destinations clicked')),
              );
            },
          ),
          CurvedAppBarAction(
            label: 'Bookmarks',
            icon: Iconsax.archive_1,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Viewed bookmarks')),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  final isSelected = cat == _selectedCategory;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedCategory = cat;
                        });
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.white.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? Colors.white : Colors.white.withOpacity(0.08),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            cat,
                            style: TextStyle(
                              color: isSelected ? const Color(0xFF0F766E) : Colors.white70,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: filteredDestinations.isEmpty
            ? const Center(child: Text('No destinations found.'))
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                itemCount: filteredDestinations.length,
                itemBuilder: (context, index) {
                  final destination = filteredDestinations[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F172A).withOpacity(0.03),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              destination.imageUrl,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 200,
                                  color: Colors.teal.shade50,
                                  child: const Center(
                                    child: Icon(Iconsax.image, size: 40, color: Colors.teal),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              top: 14,
                              right: 14,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F172A).withOpacity(0.75),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Iconsax.star1, color: Colors.amber, size: 14),
                                    const SizedBox(width: 4),
                                    Text(
                                      destination.rating.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      destination.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0F172A),
                                        letterSpacing: -0.5,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    '\$${destination.price}',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF0F766E),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Iconsax.location, size: 16, color: Colors.grey[500]),
                                  const SizedBox(width: 4),
                                  Text(
                                    destination.location,
                                    style: TextStyle(color: Colors.grey[600], fontSize: 13, fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0F766E).withOpacity(0.08),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      destination.category,
                                      style: const TextStyle(
                                        color: Color(0xFF0F766E),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                destination.description,
                                style: TextStyle(color: Colors.grey[600], fontSize: 14, height: 1.5),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
