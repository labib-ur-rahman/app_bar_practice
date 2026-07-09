import 'package:app_bar_practice/screens/actions_overflow_screen.dart';
import 'package:app_bar_practice/screens/bottom_content_screen.dart';
import 'package:app_bar_practice/screens/colors_grid_screen.dart';
import 'package:app_bar_practice/screens/custom_buttons_screen.dart';
import 'package:app_bar_practice/screens/food_delivery_screen.dart';
import 'package:app_bar_practice/screens/gradient_screen.dart';
import 'package:app_bar_practice/screens/inverted_rounded_screen.dart';
import 'package:app_bar_practice/screens/overflow_styling_screen.dart';
import 'package:app_bar_practice/screens/profile_screen.dart';
import 'package:app_bar_practice/screens/solid_color_screen.dart';
import 'package:app_bar_practice/screens/task_manager_screen.dart';
import 'package:app_bar_practice/screens/test_screen.dart';
import 'package:app_bar_practice/screens/travel_screen.dart';
import 'package:app_bar_practice/screens/visibility_animation_screen.dart';
import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

/// Main example screen that lists and routes to all demonstration screens.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF8FAFC), // Modern slate-grey background
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 111, 0, 255),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Iconsax.user,
                        color: Colors.white,
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Curved AppBar Demo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'A premium practice application',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Iconsax.home),
                    title: const Text('Home Examples'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Iconsax.colorfilter),
                    title: const Text('Color Palette Grid'),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ColorsGridScreen()),
                      );
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Iconsax.info_circle),
                    title: const Text('About App'),
                    onTap: () {
                      Navigator.of(context).pop();
                      showAboutDialog(
                        context: context,
                        applicationName: 'Curved AppBar Demo',
                        applicationVersion: '1.0.5',
                        applicationIcon: const Icon(
                          Iconsax.colorfilter,
                          color: Color.fromARGB(255, 111, 0, 255),
                          size: 40,
                        ),
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'A beautiful showcase application demonstrating modern, customizable curved app bars using the curved_app_bar Flutter package.',
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: CurvedAppBar(
        animate: true,
        shape: CurvedAppBarShape.invertedRounded,
        curveRadius: 36,
        title: const Text(
          'Curved App Bar Examples',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: const Text(
          'Interactive showcase of the curved_app_bar package',
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        subtitleTextStyle: const TextStyle(color: Colors.white70, fontSize: 12),
        backgroundColor: const Color.fromARGB(255, 111, 0, 255),
        foregroundColor: Colors.white,
        maxVisibleActionItems: 2,
        // Custom Drawer button style on CurvedAppBar
        drawerButton: Builder(
          builder: (context) {
            return IconButton.filledTonal(
              onPressed: () => Scaffold.of(context).openDrawer(),
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.2),
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Iconsax.menu, size: 20),
            );
          },
        ),
        actionItems: [
          CurvedAppBarAction(
            label: 'Info',
            icon: Iconsax.info_circle,
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Curved AppBar Demo',
                applicationVersion: '1.0.5',
                applicationIcon: const Icon(
                  Iconsax.colorfilter,
                  color: Color.fromARGB(255, 111, 0, 255),
                  size: 40,
                ),
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'A beautiful showcase application demonstrating modern, customizable curved app bars using the curved_app_bar Flutter package.',
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: const _HomeContent().withCurvedBody(),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final destinations = [
      _Destination(
        title: 'Travel Explorer',
        subtitle:
            'Rounded AppBar with a warm gradient, category filter chips bottom widget, and search action.',
        tag: 'Gradient + Bottom Chips',
        icon: Iconsax.discover,
        iconColor: const Color(0xFF0D9488), // Teal
        screen: const TravelScreen(),
      ),
      _Destination(
        title: 'Gourmet Bites Delivery',
        subtitle:
            'Inverted rounded app bar with solid color, custom back button, and content extending behind.',
        tag: 'Inverted + Solid Color',
        icon: Iconsax.shop,
        iconColor: const Color(0xFFD84315), // Deep Orange
        screen: const FoodDeliveryScreen(),
      ),
      _Destination(
        title: 'Workspace Tasks',
        subtitle:
            'Rounded app bar with automatic action overflow into popup menu, styled menu, and active progress bar.',
        tag: 'Actions Overflow + Progress',
        icon: Iconsax.task_square,
        iconColor: const Color(0xFF37474F), // Slate Grey
        screen: const TaskManagerScreen(),
      ),
      _Destination(
        title: 'User Profile Settings',
        subtitle:
            'Deep inverted curve showing a profile avatar overlapping the app bar line and setting controls.',
        tag: 'Deep Inverted Curve + Avatar',
        icon: Iconsax.user,
        iconColor: const Color(0xFF1E3A8A), // Blue
        screen: const ProfileScreen(),
      ),
      _Destination(
        title: 'Color Palette Grid',
        subtitle:
            'Inverted rounded app bar using extendBodyBehindAppBar and the layout-aware CurvedBody widget to render a 3-column color container grid.',
        tag: 'CurvedBody + GridView',
        icon: Iconsax.colorfilter,
        iconColor: const Color(0xFF6B21A8), // Purple
        screen: const ColorsGridScreen(),
      ),
      _Destination(
        title: 'Solid Color AppBar',
        subtitle:
            'Minimalist article feed featuring a solid color app bar and matching typography foreground controls.',
        tag: 'Solid Color + Article Feed',
        icon: Iconsax.book,
        iconColor: const Color(0xFF1E3A8A), // Cobalt Blue
        screen: const SolidColorScreen(),
      ),
      _Destination(
        title: 'Gradient AppBar',
        subtitle:
            'Cyber synthwave playlist utilizing a linear gradient background, neon styling, and dynamic audio selectors.',
        tag: 'Gradient + Dark Cyber Theme',
        icon: Iconsax.music,
        iconColor: const Color(0xFFEC4899), // Pink
        screen: const GradientScreen(),
      ),
      _Destination(
        title: 'Inverted Rounded Shape',
        subtitle:
            'Fitness center tracking workout steps, demonstrating how the body cards flow upward into the app bar curve.',
        tag: 'Inverted Shape + Activity Tracker',
        icon: Iconsax.flash,
        iconColor: const Color(0xFFEA580C), // Orange
        screen: const InvertedRoundedScreen(),
      ),
      _Destination(
        title: 'Custom Back & Drawer Buttons',
        subtitle:
            'Smart home controller showcasing customized, glassmorphic leading back buttons and drawer toggles.',
        tag: 'Styled Controls + Smart Home',
        icon: Iconsax.home,
        iconColor: const Color(0xFF0EA5E9), // Light Blue
        screen: const CustomButtonsScreen(),
      ),
      _Destination(
        title: 'Actions and Overflow Menu',
        subtitle:
            'Contact organizer with search filter fields, showing how multiple actions automatically pack into a three-dot popover.',
        tag: 'ActionItems + Contacts',
        icon: Iconsax.user_add,
        iconColor: const Color(0xFF0D9488), // Teal
        screen: const ActionsOverflowScreen(),
      ),
      _Destination(
        title: 'Overflow Menu Styling',
        subtitle:
            'Photo vault demonstrating custom color, icons, and text styles in the popup menu (including danger red text).',
        tag: 'Custom Popup + Photo Grid',
        icon: Iconsax.gallery,
        iconColor: const Color(0xFF1E293B), // Dark Slate
        screen: const OverflowStylingScreen(),
      ),
      _Destination(
        title: 'Bottom Content TabBar',
        subtitle:
            'Finance transaction ledger incorporating a full PreferredSize TabBar inside the bottom parameter of the app bar.',
        tag: 'PreferredSize TabBar + Finance',
        icon: Iconsax.wallet,
        iconColor: const Color(0xFF0F766E), // Dark Teal
        screen: const BottomContentScreen(),
      ),
      _Destination(
        title: 'Visibility and Animation',
        subtitle:
            'Immersive eBook reader showcasing dynamic visible showing/collapsing triggers and slide curves.',
        tag: 'Visible Toggle + eBook Reader',
        icon: Iconsax.eye,
        iconColor: const Color(0xFF4F46E5), // Indigo
        screen: const VisibilityAnimationScreen(),
      ),
      _Destination(
        title: 'Test Playground',
        subtitle:
            'A playground for testing the curved app bar with different shapes, colors, and actions.',
        tag: 'Test Playground',
        icon: Iconsax.edit,
        iconColor: const Color(0xFF4F46E5), // Indigo
        screen: const TestScreen(),
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: destinations.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final destination = destinations[index];

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => destination.screen),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: destination.iconColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        destination.icon,
                        color: destination.iconColor,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: destination.iconColor.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              destination.tag,
                              style: TextStyle(
                                color: destination.iconColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            destination.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E293B),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            destination.subtitle,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Iconsax.arrow_right_3,
                        color: Colors.grey[400],
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Destination {
  const _Destination({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.icon,
    required this.iconColor,
    required this.screen,
  });

  final String title;
  final String subtitle;
  final String tag;
  final IconData icon;
  final Color iconColor;
  final Widget screen;
}
