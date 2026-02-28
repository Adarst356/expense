import 'package:flutter/material.dart';

import '../../../utils/extensions.dart';
import '../../../utils/spacing.dart';

class ExpenseHistory extends StatelessWidget {
  const ExpenseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
              )
              )
]
          )
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
