import 'package:expense/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/extensions.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () =>
            IndexedStack(
              index: controller.currentIndex.value,
              children: controller.pages,
            ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.changeIndex(2);
        },
        backgroundColor: context.colorScheme.primary,
        elevation: 6,
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 30, color: context.colorScheme.onPrimary),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Obx(
            () =>
            BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _navItem(context, Icons.home, "Home", 0),
                    _navItem(
                      context,
                      Icons.account_balance_wallet_rounded,
                      "Budget",
                      1,
                    ),
                    Spacing.w32,
                    _navItem(context, Icons.history, "History", 3),
                    _navItem(context, Icons.settings, "Profile", 4),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget _navItem(BuildContext context,
      IconData icon,
      String label,
      int index,) {
    final isSelected = controller.currentIndex.value == index;
    return GestureDetector(
        onTap: () => controller.changeIndex(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? context.colorScheme.primary
                  : context.colorScheme.onSurfaceVariant,
            ),
            Text(
              label,
              style: context.textStyle.bodySmall?.copyWith(
                color: isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        )
    );
  }
}
