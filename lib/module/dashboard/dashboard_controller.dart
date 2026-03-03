import 'package:expense/module/dashboard/budget/budget_planner_screen.dart';
import 'package:expense/module/dashboard/expense/add_expense_screen.dart';
import 'package:expense/module/dashboard/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'history/expense_history.dart';
import 'home/home_screen.dart';

class DashboardController extends GetxController with WidgetsBindingObserver {
  var currentIndex = 0.obs;
  var selectedTab = 0.obs;
  final selectedIndex = 0.obs; // 0=DAY, 1=WEEK, 2=MONTH
  RxnString selectedCategory = RxnString();

  TextEditingController addExpenseController = TextEditingController();
  final Rxn<DateTime> selectedDate = Rxn<DateTime>();


  void select(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    HomeScreen(),
    BudgetPlannerScreen(),
    AddExpenseScreen(),
    ExpenseHistory(),
    SettingScreen(),
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
  }
  String get displayDate {
    final dt = selectedDate.value;
    if (dt == null) return "Select date";

    return "${dt.day.toString().padLeft(2, '0')}/"
        "${dt.month.toString().padLeft(2, '0')}/"
        "${dt.year}";
  }

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime(2026, 1, 1),
      firstDate: DateTime(2026, 1, 1),   ///Previous years blocked
      lastDate: DateTime(2030, 12, 31),  /// Future limit (change as needed)
      helpText: "Select Date",
      cancelText: "Cancel",
      confirmText: "Select",
    );

    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  Future<void> selectMonthYear(BuildContext context) async {
    final now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? now,
      firstDate: DateTime(now.year, 1, 1),   ///Current year se start
      lastDate: DateTime(now.year + 5, 12, 31), /// future limit (change if needed)
      initialDatePickerMode: DatePickerMode.year,
    );

    if (picked != null) {
      selectedDate.value = picked; /// GetX update
    }
  }
}
