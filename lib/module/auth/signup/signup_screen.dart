import 'package:expense/module/auth/signup/signup_controller.dart';
import 'package:expense/utils/extensions.dart';
import 'package:expense/utils/spacing.dart';
import 'package:expense/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_textfield.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create Account",  textAlign: TextAlign.center,
                style: context.textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),
              Text(
                "Join over 10,000 user managing their \n wealth with confidence",
              ),
              Spacing.h24,
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Name")
              ),
              Spacing.h4,
              AppTextField(
                controller: controller.fullNameController,
                hintText: "Enter Full name",
              ),

              Spacing.h16,

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Email Address"),
              ),
              Spacing.h4,
              AppTextField(
                controller: controller.passwordController,
                hintText: "Enter Email",
              ),
              Spacing.h16,
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password")
              ),
              Spacing.h4,
              AppTextField(
                controller: controller.passwordController,
                hintText: "Enter Password",
              ),
              Spacing.h16,

              Align(
                alignment: Alignment.centerLeft,
                child: Text("Confirm Password"),
              ),
              Spacing.h4,
              AppTextField(
                controller: controller.passwordController,
                hintText: "Enter Confirm Password",
              ),
              Spacing.h24,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppButton(text: "Create Account", onPressed: () {}),
              ),
              Spacing.h24,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: 60, height: 1, color: Colors.grey),
                  Spacing.w4,
                  Text("OR SIGNUP UP WITH"),
                  Spacing.w4,
                  Container(width: 60, height: 1, color: Colors.grey),
                ],
              ),
              Spacing.h16,

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: context.textStyle.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: context.textStyle.bodySmall?.copyWith(
                            color: context.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: context.textStyle.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: context.textStyle.bodySmall?.copyWith(
                            color: context.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Spacing.h12,

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                      children: [
                        WidgetSpan(
                            child: GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
