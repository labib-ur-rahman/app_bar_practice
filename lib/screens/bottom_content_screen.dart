import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Transaction {
  final String title;
  final String date;
  final double amount;
  final bool isIncome;

  const Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
  });
}

class BottomContentScreen extends StatefulWidget {
  const BottomContentScreen({super.key});

  @override
  State<BottomContentScreen> createState() => _BottomContentScreenState();
}

class _BottomContentScreenState extends State<BottomContentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Transaction> _transactions = const [
    Transaction(
      title: 'Salary Credit',
      date: 'Jul 08, 2026',
      amount: 3200.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Grocery Store Store',
      date: 'Jul 07, 2026',
      amount: 124.50,
      isIncome: false,
    ),
    Transaction(
      title: 'Freelance Design Project',
      date: 'Jul 05, 2026',
      amount: 450.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Electricity Power Bill',
      date: 'Jul 04, 2026',
      amount: 89.20,
      isIncome: false,
    ),
    Transaction(
      title: 'Online Video Streaming',
      date: 'Jul 02, 2026',
      amount: 14.99,
      isIncome: false,
    ),
    Transaction(
      title: 'Salary Credit',
      date: 'Jul 08, 2026',
      amount: 3200.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Grocery Store Store',
      date: 'Jul 07, 2026',
      amount: 124.50,
      isIncome: false,
    ),
    Transaction(
      title: 'Freelance Design Project',
      date: 'Jul 05, 2026',
      amount: 450.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Electricity Power Bill',
      date: 'Jul 04, 2026',
      amount: 89.20,
      isIncome: false,
    ),
    Transaction(
      title: 'Online Video Streaming',
      date: 'Jul 02, 2026',
      amount: 14.99,
      isIncome: false,
    ),
    Transaction(
      title: 'Salary Credit',
      date: 'Jul 08, 2026',
      amount: 3200.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Grocery Store Store',
      date: 'Jul 07, 2026',
      amount: 124.50,
      isIncome: false,
    ),
    Transaction(
      title: 'Freelance Design Project',
      date: 'Jul 05, 2026',
      amount: 450.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Electricity Power Bill',
      date: 'Jul 04, 2026',
      amount: 89.20,
      isIncome: false,
    ),
    Transaction(
      title: 'Online Video Streaming',
      date: 'Jul 02, 2026',
      amount: 14.99,
      isIncome: false,
    ),
    Transaction(
      title: 'Salary Credit',
      date: 'Jul 08, 2026',
      amount: 3200.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Grocery Store Store',
      date: 'Jul 07, 2026',
      amount: 124.50,
      isIncome: false,
    ),
    Transaction(
      title: 'Freelance Design Project',
      date: 'Jul 05, 2026',
      amount: 450.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Electricity Power Bill',
      date: 'Jul 04, 2026',
      amount: 89.20,
      isIncome: false,
    ),
    Transaction(
      title: 'Online Video Streaming',
      date: 'Jul 02, 2026',
      amount: 14.99,
      isIncome: false,
    ),
    Transaction(
      title: 'Salary Credit',
      date: 'Jul 08, 2026',
      amount: 3200.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Grocery Store Store',
      date: 'Jul 07, 2026',
      amount: 124.50,
      isIncome: false,
    ),
    Transaction(
      title: 'Freelance Design Project',
      date: 'Jul 05, 2026',
      amount: 450.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Electricity Power Bill',
      date: 'Jul 04, 2026',
      amount: 89.20,
      isIncome: false,
    ),
    Transaction(
      title: 'Online Video Streaming',
      date: 'Jul 02, 2026',
      amount: 14.99,
      isIncome: false,
    ),
    Transaction(
      title: 'Salary Credit',
      date: 'Jul 08, 2026',
      amount: 3200.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Grocery Store Store',
      date: 'Jul 07, 2026',
      amount: 124.50,
      isIncome: false,
    ),
    Transaction(
      title: 'Freelance Design Project',
      date: 'Jul 05, 2026',
      amount: 450.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Electricity Power Bill',
      date: 'Jul 04, 2026',
      amount: 89.20,
      isIncome: false,
    ),
    Transaction(
      title: 'Online Video Streaming',
      date: 'Jul 02, 2026',
      amount: 14.99,
      isIncome: false,
    ),
    Transaction(
      title: 'Salary Credit',
      date: 'Jul 08, 2026',
      amount: 3200.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Grocery Store Store',
      date: 'Jul 07, 2026',
      amount: 124.50,
      isIncome: false,
    ),
    Transaction(
      title: 'Freelance Design Project',
      date: 'Jul 05, 2026',
      amount: 450.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Electricity Power Bill',
      date: 'Jul 04, 2026',
      amount: 89.20,
      isIncome: false,
    ),
    Transaction(
      title: 'Online Video Streaming',
      date: 'Jul 02, 2026',
      amount: 14.99,
      isIncome: false,
    ),
    Transaction(
      title: 'Salary Credit',
      date: 'Jul 08, 2026',
      amount: 3200.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Grocery Store Store',
      date: 'Jul 07, 2026',
      amount: 124.50,
      isIncome: false,
    ),
    Transaction(
      title: 'Freelance Design Project',
      date: 'Jul 05, 2026',
      amount: 450.00,
      isIncome: true,
    ),
    Transaction(
      title: 'Electricity Power Bill',
      date: 'Jul 04, 2026',
      amount: 89.20,
      isIncome: false,
    ),
    Transaction(
      title: 'Online Video Streaming',
      date: 'Jul 02, 2026',
      amount: 14.99,
      isIncome: false,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFD),
      appBar: CurvedAppBar(
        shape: CurvedAppBarShape.rounded,
        curveRadius: 24,
        backgroundColor: const Color(0xFF0F766E), // Teal 700
        foregroundColor: Colors.white,
        title: const Text(
          'Wallet Ledger',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        subtitle: const Text('Bottom PreferredSize Tabs Demo'),
        backButton: IconButton.filledTonal(
          onPressed: () => Navigator.of(context).maybePop(),
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Iconsax.arrow_left_2, size: 16),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelColor: const Color(0xFF0F766E),
                  unselectedLabelColor: Colors.white,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  tabs: const [
                    Tab(text: 'All Trx', height: 40),
                    Tab(text: 'Income', height: 40),
                    Tab(text: 'Expenses', height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTransactionList(_transactions),
          _buildTransactionList(
            _transactions.where((t) => t.isIncome).toList(),
          ),
          _buildTransactionList(
            _transactions.where((t) => !t.isIncome).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionList(List<Transaction> trx) {
    if (trx.isEmpty) {
      return const Center(child: Text('No transaction logs.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      itemCount: trx.length,
      itemBuilder: (context, index) {
        final t = trx[index];
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
              vertical: 4,
            ),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: t.isIncome
                    ? Colors.green.withOpacity(0.1)
                    : Colors.redAccent.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                t.isIncome ? Iconsax.card_receive : Iconsax.card_send,
                color: t.isIncome ? Colors.green : Colors.redAccent,
                size: 20,
              ),
            ),
            title: Text(
              t.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              t.date,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            trailing: Text(
              '${t.isIncome ? '+' : '-'}\$${t.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: t.isIncome ? Colors.green : Colors.redAccent,
                fontSize: 16,
              ),
            ),
          ),
        );
      },
    );
  }
}
