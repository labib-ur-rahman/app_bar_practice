import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FoodItem {
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String duration;
  final double price;
  final String description;

  const FoodItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.duration,
    required this.price,
    required this.description,
  });
}

class FoodDeliveryScreen extends StatefulWidget {
  const FoodDeliveryScreen({super.key});

  @override
  State<FoodDeliveryScreen> createState() => _FoodDeliveryScreenState();
}

class _FoodDeliveryScreenState extends State<FoodDeliveryScreen> {
  final List<FoodItem> _foodItems = const [
    FoodItem(
      id: '1',
      name: 'Double Truffle Cheeseburger',
      imageUrl:
          'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=600&q=80',
      rating: 4.8,
      duration: '15-20 min',
      price: 12.99,
      description:
          'Two grass-fed beef patties, double Swiss cheese, caramelized onions, and black truffle aioli on a brioche bun.',
    ),
    FoodItem(
      id: '2',
      name: 'Artisan Pepperoni Pizza',
      imageUrl:
          'https://images.unsplash.com/photo-1513104890138-7c749659a591?auto=format&fit=crop&w=600&q=80',
      rating: 4.9,
      duration: '20-25 min',
      price: 15.50,
      description:
          'Slow-fermented sourdough crust, san marzano tomato sauce, fresh mozzarella, spicy pepperoni, and hot honey drizzle.',
    ),
    FoodItem(
      id: '3',
      name: 'Fresh Atlantic Salmon Bowl',
      imageUrl:
          'https://images.unsplash.com/photo-1467003909585-2f8a72700288?auto=format&fit=crop&w=600&q=80',
      rating: 4.7,
      duration: '10-15 min',
      price: 14.25,
      description:
          'Grilled salmon fillet, organic brown rice, avocado, pickled ginger, seaweed salad, and signature sesame soy dressing.',
    ),
    FoodItem(
      id: '4',
      name: 'Gourmet Matcha Waffles',
      imageUrl:
          'https://images.unsplash.com/photo-1564759974727-41b97e3434ac?auto=format&fit=crop&w=600&q=80',
      rating: 4.6,
      duration: '15-20 min',
      price: 9.99,
      description:
          'Fluffy green tea waffles topped with fresh organic strawberries, wild berry compote, and pure maple syrup.',
    ),
  ];

  final Map<String, int> _cart = {};

  void _addToCart(String id) {
    setState(() {
      _cart[id] = (_cart[id] ?? 0) + 1;
    });
  }

  void _removeFromCart(String id) {
    if ((_cart[id] ?? 0) > 0) {
      setState(() {
        _cart[id] = _cart[id]! - 1;
        if (_cart[id] == 0) {
          _cart.remove(id);
        }
      });
    }
  }

  double _calculateTotal() {
    double total = 0.0;
    _cart.forEach((id, qty) {
      final item = _foodItems.firstWhere((item) => item.id == id);
      total += item.price * qty;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final double total = _calculateTotal();
    final int cartCount = _cart.values.fold(0, (sum, val) => sum + val);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFFDFDFD), // Clean white background
      appBar: CurvedAppBar(
        shape: CurvedAppBarShape.invertedRounded,
        curveRadius: 32,
        backgroundGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFE65100), // Violet 500
            Color(0xFFEC4899), // Pink 500
          ],
        ),
        backgroundColor: const Color(0xFFE65100), // Rich Warm Orange 900
        foregroundColor: Colors.white,
        title: const Text(
          'Gourmet Bites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 0.5,
          ),
        ),
        subtitle: const Text(
          'Fresh gourmet food delivered to you',
          style: TextStyle(color: Colors.white70),
        ),
        backButton: IconButton.filledTonal(
          onPressed: () => Navigator.of(context).maybePop(),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Iconsax.arrow_left_2, size: 16),
        ),
        actionItems: [
          CurvedAppBarAction(
            label: 'Search Menu',
            icon: Iconsax.search_normal_1,
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Search dishes')));
            },
          ),
          CurvedAppBarAction(
            label: 'Shopping Cart',
            icon: Iconsax.shopping_bag,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Open cart containing $cartCount items'),
                ),
              );
            },
          ),
        ],
      ),
      body: CurvedBody(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                itemCount: _foodItems.length,
                itemBuilder: (context, index) {
                  final food = _foodItems[index];
                  final count = _cart[food.id] ?? 0;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFF1F5F9)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF0F172A).withOpacity(0.03),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
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
                              food.imageUrl,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 180,
                                  color: Colors.deepOrange.shade50,
                                  child: const Center(
                                    child: Icon(
                                      Iconsax.coffee,
                                      size: 40,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                );
                              },
                            ),
                            Positioned(
                              bottom: 12,
                              right: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.08),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  food.duration,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      food.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0F172A),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    '\$${food.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFFE65100),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Iconsax.star1,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    food.rating.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Icon(
                                    Iconsax.truck_fast,
                                    size: 16,
                                    color: Colors.grey[500],
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Free Delivery',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                food.description,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  height: 1.45,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Order Quantity',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  if (count == 0)
                                    ElevatedButton(
                                      onPressed: () => _addToCart(food.id),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFFE65100,
                                        ),
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Iconsax.shopping_cart, size: 14),
                                          SizedBox(width: 6),
                                          Text(
                                            'Add to Order',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  else
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () =>
                                              _removeFromCart(food.id),
                                          icon: const Icon(
                                            Iconsax.minus,
                                            size: 16,
                                          ),
                                          style: IconButton.styleFrom(
                                            backgroundColor: Colors.grey[100],
                                            foregroundColor: Colors.black87,
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: Text(
                                            count.toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => _addToCart(food.id),
                                          icon: const Icon(
                                            Iconsax.add,
                                            size: 16,
                                          ),
                                          style: IconButton.styleFrom(
                                            backgroundColor: const Color(
                                              0xFFE65100,
                                            ).withOpacity(0.1),
                                            foregroundColor: const Color(
                                              0xFFE65100,
                                            ),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
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
            if (cartCount > 0)
              SafeArea(
                top: false,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$cartCount items selected',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '\$${total.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFE65100),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Order placed successfully!'),
                            ),
                          );
                          setState(() {
                            _cart.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE65100),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
