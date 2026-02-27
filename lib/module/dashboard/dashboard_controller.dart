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

}
