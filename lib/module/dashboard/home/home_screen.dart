import 'package:expense/utils/extensions.dart';
import 'package:expense/utils/spacing.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
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
                      foregroundColor: context.colorScheme.onPrimaryContainer,
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
         IncomeExpenseChip(context, title: 'INCOME', icon: Icons.add),
         Spacing.w8,
         IncomeExpenseChip(context, title: 'INCOME', icon: Icons.remove)
       ],
     )
          ],
        ),
      ),
    );
  }

  Widget IncomeExpenseChip(BuildContext context,{
    required String title,
    required IconData icon,
  }) {
    return Container(
            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
            decoration: BoxDecoration(
              color: context.colorScheme.onPrimary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black.withOpacity(0.1))
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                  foregroundColor:Colors.white,
                  child:  Icon(icon),
                ),
                Spacing.w8,
                Text(title, style: context.textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                )
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
                style: context.textStyle.bodyMedium?.copyWith(color: Colors.white),
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
