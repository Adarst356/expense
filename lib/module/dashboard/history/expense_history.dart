import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/extensions.dart';
import '../../../utils/spacing.dart';
import '../dashboard_controller.dart';

class ExpenseHistory extends GetView<DashboardController> {
  ExpenseHistory({super.key});

  final List<String> expenseCategories = [
    "All",
    "Food & Drink",
    "Shopping",
    "Housing",
    "Transport",
    "Bills",
    "Entertainment",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense History',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textStyle.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: incomeExpense(
                      context,
                      title: "INCOME",
                      amount: "+\$ 2,000.00",
                      icon: Icons.arrow_downward,
                      bgColor: Colors.green,
                    ),
                  ),
                  Spacing.w12,
                  Expanded(
                    child: incomeExpense(
                      context,
                      title: "EXPENSE",
                      amount: "-\$ 750.00",
                      icon: Icons.arrow_upward,
                      bgColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                          Spacing.w8,
                          Text("October 2023"),
                          Icon(
                            Icons.arrow_drop_down,
                            color: context.colorScheme.onPrimaryContainer,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacing.w12,
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: context.colorScheme.onPrimary,
                    foregroundColor: context.colorScheme.onPrimaryContainer,
                    child: const Icon(Icons.tune),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: expenseCategories.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final month = expenseCategories[index];
                  return Obx(() {
                    final isSelected = controller.selectedIndex.value == index;
                    return budgetMonth(
                      context,
                      title: month,
                      isSelected: isSelected,
                      onTap: () => controller.select(index),
                    );
                  });
                },
              ),
            ),
            Spacing.h12,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
              child: Text(
                "TODAY",
                style: context.textStyle.labelMedium?.copyWith(
                  letterSpacing: 1.2,
                  fontSize: 14,
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: transactionTile(context),
                );
            },),
            Spacing.h12,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8.0),
              child: Text(
                "YESTERDAY",
                style: context.textStyle.labelMedium?.copyWith(
                  letterSpacing: 1.2,
                  fontSize: 14,
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: transactionTile(context),
                );
              },
            ),
          ],
        ),
      ),

    );
  }

  Widget transactionTile(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.withOpacity(0.15),
            ),
            child: const Icon(Icons.restaurant, color: Colors.orange, size: 22),
          ),
          Spacing.w12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Starbucks Coffee",
                  style: context.textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "10:45 AM • Food & Drink",
                  style: context.textStyle.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "-\$12.50",
                style: context.textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colorScheme.error,
                ),
              ),
              Spacing.h8,
              Row(
                children: [
                  Icon(Icons.edit, size: 16, color: Colors.grey),
                  Spacing.w8,
                  Icon(Icons.delete_outline, size: 16, color: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget budgetMonth(
    BuildContext context, {
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textStyle.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? context.colorScheme.onPrimary
                  : context.colorScheme.onSurface,
            ),
          ),
        ),
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
