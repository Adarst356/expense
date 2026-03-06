import 'package:expense/utils/extensions.dart';
import 'package:expense/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard_controller.dart';

class BudgetPlannerScreen extends GetView<DashboardController> {
  BudgetPlannerScreen({super.key});

  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  final categories = <Map<String, dynamic>>[
    {
      'title': 'Monthly Rent',
      'limit': 'Limit: \$2000',
      'amount': '\$2000',
      'icon': Icons.home,
      'bgColor': Colors.blue,
      'offer': '10% budget used',
    },
    {
      'title': 'Grocery',
      'limit': 'Limit: \$100',
      'amount': '\$2000',
      'icon': Icons.local_grocery_store,
      'bgColor': Colors.green,
      'offer': '20% budget used',
    },
    {
      'title': 'Transportation',
      'limit': 'Limit: \$1000',
      'amount': '\$10',
      'icon': Icons.bike_scooter,
      'bgColor': Colors.red,
      'offer': '50% budget used',
    },
    {
      'title': 'Apple Store',
      'limit': 'Limit: \$300',
      'amount': '\$-120:00',
      'icon': Icons.phone_iphone,
      'bgColor': Colors.cyan,
      'offer': '80% budget used',
    },

    {
      'title': 'GYM MemberShip',
      'limit': 'Limit: \$200',
      'amount': '\$10',
      'icon': Icons.fitness_center,
      'bgColor': Colors.yellow,
      'offer': '5% budget used',
    },
    {
      'title': 'Entertainment',
      'limit': 'Limit: \$50',
      'amount': '\$10',
      'icon': Icons.movie,
      'bgColor': Colors.greenAccent,
      'offer': '30% budget used',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacing.h12,
              Text(
                'Budget Planner',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: context.colorScheme.onSurface,
                ),
              ),

              Text(
                'February 2026',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textStyle.labelSmall?.copyWith(
                  fontSize: 12,
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.only(right: 16),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: context.colorScheme.onPrimary,
              foregroundColor: context.colorScheme.primary,
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.h24,
              SizedBox(
                height: 44,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: months.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final month = months[index];
                    return Obx(() {
                      final isSelected =
                          controller.selectedIndex.value == index;
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
              totalRemainingCard(context),
              Spacing.h12,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: context.textStyle.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: Icon(
                              Icons.add,
                              size: 16,
                              color: context.colorScheme.primary,
                            ),
                          ),
                          const WidgetSpan(child: Spacing.w4),
                          TextSpan(
                            text: "Add Category",
                            style: context.textStyle.bodyMedium?.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacing.h12,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final item = categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: categoryList(
                      context,
                      title: item['title'],
                      title1: item['limit'],
                      amount: item['amount'],
                      icon: item['icon'],
                      bgColor: item['bgColor'],
                      time: item['offer'],
                    ),
                  );
                },
              ),
              Spacing.h16,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Financial Goals",
                  style: context.textStyle.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Spacing.h12,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF0F172A), Color(0xFF1E3A8A)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 52,
                        width: 52,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: 0.72,
                              strokeWidth: 5,
                              backgroundColor: Colors.white.withOpacity(0.15),
                              valueColor: const AlwaysStoppedAnimation(
                                Colors.blueAccent,
                              ),
                            ),
                            const Text(
                              "72%",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Spacing.w12,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New MacBook Pro",
                              style: context.textStyle.titleMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacing.h4,
                            Text(
                              "\$1,800 of \$2,500 saved",
                              style: context.textStyle.bodySmall?.copyWith(
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),

                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white.withOpacity(0.15),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacing.h24,
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryList(
    BuildContext context, {
    required String title,
    required String title1,
    required String amount,
    required IconData icon,
    required Color bgColor,
    required String time,
    double spent = 2750,
    double budget = 4000,
  }) {
    final progress = (spent / budget).clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 22, color: bgColor),
          ),

          Spacing.w12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacing.h4,
                Text(
                  time,
                  style: context.textStyle.labelMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant.withOpacity(
                      0.6,
                    ),
                  ),
                ),
                Spacing.h8,
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor:
                        context.colorScheme.surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation(bgColor),
                  ),
                ),
              ],
            ),
          ),

          Spacing.w12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: context.textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: bgColor,
                ),
              ),
              Spacing.h4,
              Text(
                title1,
                style: context.textStyle.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget totalRemainingCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: context.colorScheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Remaining",
                  style: context.textStyle.bodyMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: const Icon(Icons.bar_chart, color: Colors.white),
                ),
              ],
            ),
            Spacing.h8,
            Text(
              "\$1,250.00",
              style: context.textStyle.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacing.h16,
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: 2750 / 4000,
                minHeight: 8,
                backgroundColor: Colors.white.withOpacity(0.3),
                valueColor: const AlwaysStoppedAnimation(Colors.white),
              ),
            ),
            Spacing.h8,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Spent \$2,750",
                  style: context.textStyle.labelMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                Text(
                  "Budget \$4,000",
                  style: context.textStyle.labelMedium?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ],
        ),
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
}
