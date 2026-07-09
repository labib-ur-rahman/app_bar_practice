import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Contact {
  final String name;
  final String phone;
  final String email;

  const Contact({required this.name, required this.phone, required this.email});
}

class ActionsOverflowScreen extends StatefulWidget {
  const ActionsOverflowScreen({super.key});

  @override
  State<ActionsOverflowScreen> createState() => _ActionsOverflowScreenState();
}

class _ActionsOverflowScreenState extends State<ActionsOverflowScreen> {
  final List<Contact> _contacts = const [
    Contact(
      name: 'Albert Flores',
      phone: '(219) 555-0114',
      email: 'albert.flores@example.com',
    ),
    Contact(
      name: 'Bessie Cooper',
      phone: '(602) 555-0177',
      email: 'bessie.cooper@example.com',
    ),
    Contact(
      name: 'Devon Webb',
      phone: '(704) 555-0120',
      email: 'devon.webb@example.com',
    ),
    Contact(
      name: 'Eleanor Pena',
      phone: '(208) 555-0189',
      email: 'eleanor.pena@example.com',
    ),
    Contact(
      name: 'Jane Cooper',
      phone: '(229) 555-0109',
      email: 'jane.cooper@example.com',
    ),
    Contact(
      name: 'Ronald Richards',
      phone: '(302) 555-0107',
      email: 'ronald.richards@example.com',
    ),
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredContacts = _contacts
        .where(
          (contact) =>
              contact.name.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: CurvedAppBar(
        shape: CurvedAppBarShape.rounded,
        curveRadius: 28,
        backgroundColor: const Color(0xFF0D9488), // Teal 600
        foregroundColor: Colors.white,
        title: const Text(
          'Contact Book',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        subtitle: const Text('Actions & Overflow Menu Demo'),
        backButton: IconButton.filledTonal(
          onPressed: () => Navigator.of(context).maybePop(),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Iconsax.arrow_left_2, size: 16),
        ),
        maxVisibleActionItems: 2,
        actionItems: [
          CurvedAppBarAction(
            label: 'Add Contact',
            icon: Iconsax.user_add,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add new contact opened')),
              );
            },
          ),
          CurvedAppBarAction(
            label: 'Quick Call',
            icon: Iconsax.call,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Starting quick speed-dial...')),
              );
            },
          ),
          CurvedAppBarAction(
            label: 'Share Contacts',
            icon: Iconsax.send,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contacts shared successfully')),
              );
            },
          ),
          CurvedAppBarAction(
            label: 'Export CSV',
            icon: Iconsax.document_download,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contacts exported as CSV')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  _searchQuery = val;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search contacts...',
                prefixIcon: const Icon(
                  Iconsax.search_normal_1,
                  color: Colors.grey,
                  size: 18,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Color(0xFF0D9488)),
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredContacts.isEmpty
                ? const Center(child: Text('No contacts match your query.'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    itemCount: filteredContacts.length,
                    itemBuilder: (context, index) {
                      final contact = filteredContacts[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          leading: CircleAvatar(
                            backgroundColor: const Color(
                              0xFF0D9488,
                            ).withOpacity(0.1),
                            foregroundColor: const Color(0xFF0D9488),
                            child: Text(
                              contact.name.split(' ').map((e) => e[0]).join(''),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Text(
                            contact.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          subtitle: Text(
                            contact.phone,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Iconsax.message,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Messaging ${contact.name}',
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Iconsax.call,
                                  size: 18,
                                  color: Color(0xFF0D9488),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Calling ${contact.name}'),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
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
