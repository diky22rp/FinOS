import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=3',
                      ), // Dummy avatar
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Welcome back,',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6B6B6B),
                            ),
                          ),
                          Text(
                            'Alex M.',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search, color: Color(0xFF6B6B6B)),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none,
                        color: Color(0xFF6B6B6B),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Balance Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Total Balance',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B6B6B),
                            ),
                          ),
                          const Spacer(),
                          Icon(Icons.more_horiz, color: Color(0xFF6B6B6B)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '\$12,480.50',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF222B45),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _BalanceStat(
                            label: 'Income',
                            value: '+\$5,230',
                            color: Color(0xFF2ECC71),
                          ),
                          _BalanceStat(
                            label: 'Expenses',
                            value: '-\$1,890',
                            color: Color(0xFFE74C3C),
                          ),
                          _BalanceStat(
                            label: 'Savings',
                            value: '+\$3,340',
                            color: Color(0xFF3B82F6),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // Recent Transactions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF2ECC71),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const _TransactionTile(
                  icon: Icons.shopping_bag,
                  iconBg: Color(0xFFFFE5E5),
                  iconColor: Color(0xFFE74C3C),
                  title: 'Groceries',
                  subtitle: 'Today, 10:45 AM',
                  amount: '-\$75.50',
                  amountColor: Color(0xFFE74C3C),
                ),
                const SizedBox(height: 10),
                const _TransactionTile(
                  icon: Icons.attach_money,
                  iconBg: Color(0xFFE6FFF2),
                  iconColor: Color(0xFF2ECC71),
                  title: 'Salary',
                  subtitle: 'Yesterday, 9:00 AM',
                  amount: '+\$2,500.00',
                  amountColor: Color(0xFF2ECC71),
                ),
                const SizedBox(height: 10),
                const _TransactionTile(
                  icon: Icons.subscriptions,
                  iconBg: Color(0xFFE6F0FF),
                  iconColor: Color(0xFF3B82F6),
                  title: 'Netflix',
                  subtitle: 'Oct 12, 2023',
                  amount: '-\$15.99',
                  amountColor: Color(0xFF6B6B6B),
                ),
                const SizedBox(height: 32),
                // Upcoming Bills
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Upcoming Bills',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF2ECC71),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const _TransactionTile(
                  icon: Icons.flash_on,
                  iconBg: Color(0xFFFFF6E5),
                  iconColor: Color(0xFFF7B731),
                  title: 'Electricity Bill',
                  subtitle: 'Due in 3 days',
                  amount: '\$120.00',
                  amountColor: Color(0xFF222B45),
                ),
                const SizedBox(height: 10),
                const _TransactionTile(
                  icon: Icons.home,
                  iconBg: Color(0xFFF3E6FF),
                  iconColor: Color(0xFF9B59B6),
                  title: 'Rent',
                  subtitle: 'Due in 10 days',
                  amount: '\$1,200.00',
                  amountColor: Color(0xFF222B45),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
      // BottomNavigationBar dihapus, menu utama sekarang di MainPage
    );
  }
}

class _BalanceStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _BalanceStat({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF6B6B6B)),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  const _TransactionTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
