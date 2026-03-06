import 'package:expense/utils/extensions.dart';
import 'package:expense/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../dashboard_controller.dart';

class AddExpenseScreen extends GetView<DashboardController> {
  AddExpenseScreen({super.key});

  final categories = ["Food", "Shopping", "Travel", "Bills", "Entertainment"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Add Expense',
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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.h24,
              Padding(
                padding: const EdgeInsets.all(16),
                child: totalAmountField(context),
              ),
              Spacing.h16,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.category, color: context.colorScheme.primary),
                    Spacing.w4,
                    Text("Category", style: context.textStyle.titleMedium),
                  ],
                ),
              ),
              Obx(() {
                return categoryDropdownField(
                  context,
                  value: controller.selectedCategory.value,
                  items: categories,
                  onChanged: (val) {
                    controller.selectedCategory.value = val;
                  },
                );
              }),

              Padding(
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    Icon(Icons.date_range, color: context.colorScheme.primary),
                    Spacing.w4,
                    Text("Date", style: context.textStyle.titleMedium),
                  ],
                ),
              ),
              dateField(context),
              Spacing.h8,
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text("Note", style: context.textStyle.titleMedium),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: context.colorScheme.onSurfaceVariant.withOpacity(
                        0.2,
                      ),
                    ),
                  ),
                  child: TextField(
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      hintText: "Add a note",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dateField(BuildContext context) {
    return Obx(() {
      final isEmpty = controller.selectedDate.value == null;
      return InkWell(
        onTap: () => controller.pickDate(context),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isEmpty
                    ? context.colorScheme.onSurfaceVariant.withOpacity(0.3)
                    : context.colorScheme.primary.withOpacity(0.7),
                width: 1.2,
              ),
              color: context.colorScheme.surface,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: isEmpty
                      ? context.colorScheme.onSurfaceVariant
                      : context.colorScheme.primary,
                ),
                Spacing.w12,
                Expanded(
                  child: Text(
                    controller.displayDate,
                    style: context.textStyle.bodyMedium?.copyWith(
                      color: isEmpty
                          ? context.colorScheme.onSurfaceVariant
                          : context.colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget categoryDropdownField(
    BuildContext context, {
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.colorScheme.onSurfaceVariant.withOpacity(0.2),
          ),
          color: context.colorScheme.surface,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            hint: Text(
              "Select a category",
              style: context.textStyle.bodyMedium?.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            items: items
                .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  Widget totalAmountField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "TOTAL AMOUNT",
            style: context.textStyle.labelMedium?.copyWith(
              fontSize: 16,
              letterSpacing: 1.2,
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Spacing.h8,
        Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue, width: 1.5),
          ),
          child: Row(
            children: [
              Text(
                "\$",
                style: context.textStyle.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),

              Spacing.w8,
              Expanded(
                child: TextField(
                  controller: controller.addExpenseController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  style: context.textStyle.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                    hintText: "0.00",
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.keyboard_arrow_up, size: 20, color: Colors.grey),
                  Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
