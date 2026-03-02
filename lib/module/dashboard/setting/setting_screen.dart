import 'package:expense/utils/extensions.dart';
import 'package:expense/utils/spacing.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: context.colorScheme.errorContainer,
                        foregroundColor: context.colorScheme.primary,
                        child: Icon(Icons.mobile_off),
                      ),
                      Spacing.w12,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Alex Johnson",
                            style: context.textStyle.titleMedium,
                          ),
                          Text(
                            "adarsht356@gmail.com",
                            style: context.textStyle.labelSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Spacing.h12,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  "PREFERENCES",
                  style: context.textStyle.labelMedium?.copyWith(
                    letterSpacing: 1.2,
                    fontSize: 14,
                    color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacing.h8,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          foregroundColor: context.colorScheme.primary,
                          backgroundColor: context.colorScheme.onPrimary,
                          child: Icon(Icons.currency_exchange),
                  ),
                        title: Text(
                          "Currency",
                          style: context.textStyle.titleMedium,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "USD (\$)",
                              style: context.textStyle.bodyMedium?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            Spacing.w8,
                            Icon(Icons.chevron_right, size: 20),
                          ],
                        ),
                        onTap: () {},
                      ),
                      Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          foregroundColor: context.colorScheme.primary,
                          backgroundColor: context.colorScheme.onPrimary,
                          child: Icon(Icons.notifications),
                        ),
                        title: Text(
                          "Notifications",
                          style: context.textStyle.titleMedium,
                        ),
                        trailing: Switch(value: true, onChanged: (value) {}),
                      ),
                    ],
                  ),
                ),
              ),
              Spacing.h8,
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  "ABOUT",
                  style: context.textStyle.labelMedium?.copyWith(
                    letterSpacing: 1.2,
                    fontSize: 14,
                    color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacing.h8,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          foregroundColor: context.colorScheme.primary,
                          backgroundColor: context.colorScheme.onPrimary,
                          child: Icon(Icons.privacy_tip),
                  ),
                        title: Text(
                          "Privacy Policy",
                          style: context.textStyle.titleMedium,
                        ),
                        trailing: Icon(Icons.chevron_right, size: 20),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          foregroundColor: context.colorScheme.primary,
                          backgroundColor: context.colorScheme.onPrimary,
                          child: Icon(Icons.info),
                        ),
                        title: Text(
                          "App Version",
                          style: context.textStyle.titleMedium,
                        ),
                        trailing: Text("App Version 1.0.0"),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Spacing.h24,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.error,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    onPressed: () {
          
                    },
                    child: Text(
                      "Log Out",
                      style: context.textStyle.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Spacing.h16,

            ],
          ),
        ),
      ),
    );
  }
}
