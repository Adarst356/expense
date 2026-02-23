import 'package:expense/utils/extensions.dart';
import 'package:expense/utils/spacing.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.account_balance_wallet,
                color: context.colorScheme.onPrimary,
                size: 28,
              ),
            ),
            Spacing.h8,
            Text(
              "FinTrack.",
              style: context.textStyle.titleLarge?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacing.h8,
            Text(
              "SMART BUDGET & INSIGHTS",
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: context.colorScheme.outline,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
