import 'package:expense/routes/app_routes.dart';
import 'package:expense/utils/spacing.dart';
import 'package:expense/widgets/app_button.dart';
import 'package:expense/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/extensions.dart';
import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.account_balance_wallet,
                    size: 32,
                    color: context.colorScheme.primary,
                  ),
                ),
                Spacing.h12,
                Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Spacing.h4,
                Text(
                  "Login to manage your finance",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacing.h24,
            
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Name"),
                ),
                Spacing.h4,
                AppTextField(
                  controller: controller.nameController,
                  hintText: "Enter name",
                ),
            
                Spacing.h16,
            
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password"),
                ),
                Spacing.h4,
                AppTextField(
                  controller: controller.passwordController,
                  hintText: "Enter password",
                  obscureText: true,
                ),
            
                Spacing.h8,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: context.textStyle.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Spacing.h16,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AppButton(
                    text: "Login",
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.dashboard);
                    },
            
                ),
                ),
            
                Spacing.h16,
            
                Text(
                  "Quick Access",
                  textAlign: TextAlign.center,
                  style: context.textStyle.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
                Spacing.h12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialButton(context, "assets/images/google.png"),
                    Spacing.w12,
                    _socialButton(context, "assets/images/face.png"),
                  ],
                ),
                Spacing.h24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: context.textStyle.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Spacing.w4,
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.signupScreen);
                      },
                      child: Text(
                        "Sign Up",
                        style: context.textStyle.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(BuildContext context, String asset) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Image.asset(asset, height: 20, width: 20),
    );
  }
}