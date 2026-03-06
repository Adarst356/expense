import 'package:expense/module/dashboard/dashboard_controller.dart';
import 'package:expense/module/dashboard/home/spending_graph.dart';
import 'package:expense/utils/extensions.dart';
import 'package:expense/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<DashboardController> {
  HomeScreen({super.key});

  final transactions = <Map<String, dynamic>>[
    {
      'title': 'Monthly Rent',
      'title1': 'Housing',
      'amount': '\$2000',
      'icon': Icons.home,
      'bgColor': Colors.green,
      'time': 'Today 09:41 AM',
    },
    {
      'title': 'Starbucks Coffee',
      'title1': 'Food',
      'amount': '\$-5.0',
      'icon': Icons.local_cafe,
      'bgColor': Colors.red,
      'time': 'Today 10:20 AM',
    },
    {
      'title': 'Apple Store',
      'title1': 'Tech',
      'amount': '\$-120:00',
      'icon': Icons.phone_iphone,
      'bgColor': Colors.cyan,
      'time': 'Yesterday 09:00 PM',
    },
    {
      'title': 'Salary Deposit',
      'title1': 'Salary',
      'amount': '\$5,000',
      'icon': Icons.account_balance_wallet,
      'bgColor': Colors.green,
      'time': 'Yesterday 06:00 PM',
    },
    {
      'title': 'GYM MemberShip',
      'title1': 'Fitness',
      'amount': '\$10',
      'icon': Icons.fitness_center,
      'bgColor': Colors.deepPurple,
      'time': 'Tomorrow 02:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: context.colorScheme.primaryContainer,
                          foregroundColor:
                              context.colorScheme.onPrimaryContainer,
                          child: const Icon(Icons.person),
                        ),
                        Spacing.w12,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Good Morning",
                              style: context.textStyle.bodyLarge?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Text(
                              "Hey Alex",
                              style: context.textStyle.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                Spacing.h24,
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Total Expense",
                            style: context.textStyle.bodyMedium?.copyWith(
                              color: context.colorScheme.onPrimaryContainer,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.remove_red_eye,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                        ],
                      ),
                      Spacing.h8,
                      Text(
                        "\$ 1,250.00",
                        style: context.textStyle.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.onPrimaryContainer,
                        ),
                      ),
                      Spacing.h12,
                      Row(
                        children: [
                          Expanded(
                            child: incomeExpense(
                              context,
                              title: "INCOME",
                              amount: "\$ 2,000.00",
                              icon: Icons.arrow_downward,
                              bgColor: Colors.green,
                            ),
                          ),
                          Spacing.w12,
                          Expanded(
                            child: incomeExpense(
                              context,
                              title: "EXPENSE",
                              amount: "\$ 750.00",
                              icon: Icons.arrow_upward,
                              bgColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacing.h12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    quickActionRow(
                      context,
                      title: 'Income',
                      icon: Icons.add,
                      bgColor: context.colorScheme.primary,
                    ),
                    Spacing.w8,
                    quickActionRow(
                      context,
                      title: 'Expense',
                      icon: Icons.remove,
                      bgColor: context.colorScheme.error,
                    ),
                  ],
                ),
                Spacing.h12,
                SpendingChartCard(),
                Spacing.h12,
                Row(
                  children: [
                    Text(
                      "Recent Transactions",
                      style: context.textStyle.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "View All",
                      style: context.textStyle.bodyMedium?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Spacing.h12,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final item = transactions[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: recentTransactionList(
                        context,
                        title: item['title'],
                        title1: item['title1'],
                        amount: item['amount'],
                        icon: item['icon'],
                        bgColor: item['bgColor'],
                        time: item['time'],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget recentTransactionList(
    BuildContext context, {
    required String title,
    required String title1,
    required String amount,
    required IconData icon,
    required Color bgColor,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colorScheme.onTertiaryContainer.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.colorScheme.errorContainer.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 20, color: bgColor),
          ),
          Spacing.w12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: context.textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                time,
                style: context.textStyle.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                amount,
                style: context.textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.error,
                ),
              ),

              Text(
                title1,
                style: context.textStyle.titleMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget quickActionRow(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color bgColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: bgColor.withOpacity(0.1),
            foregroundColor: Colors.white,
            child: Icon(icon),
          ),
          Spacing.w8,
          Text(
            title,
            style: context.textStyle.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget incomeExpense(
    BuildContext context, {
    required String title,
    required String amount,
    required IconData icon,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 18),
              Spacing.w8,
              Text(
                title,
                style: context.textStyle.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Spacing.h4,
          Text(
            amount,
            style: context.textStyle.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
