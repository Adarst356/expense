import 'package:expense/utils/toast_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_routes.dart';

class SignupController extends GetxController {

  /// Controllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final supabase = Supabase.instance.client;

  /// Reactive Errors
  var nameError = RxnString();
  var emailError = RxnString();
  var passwordError = RxnString();
  var confirmPasswordError = RxnString();

  /// --- Validation Functions ---

  void validateName(String value) {
    if (value.isEmpty) {
      nameError.value = "Please enter your name";
    } else if (value.length < 3) {
      nameError.value = "Name must be at least 3 characters";
    } else {
      nameError.value = null;
    }
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = "Please enter your email";
    } else if (!GetUtils.isEmail(value)) {
      emailError.value = "Enter valid email address";
    } else {
      emailError.value = null;
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = "Please enter password";
    } else if (value.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordError.value = "Please confirm password";
    } else if (value != passwordController.text) {
      confirmPasswordError.value = "Passwords do not match";
    } else {
      confirmPasswordError.value = null;
    }
  }

  bool validateForm() {
    validateName(fullNameController.text);
    validateEmail(emailController.text);
    validatePassword(passwordController.text);
    validateConfirmPassword(confirmPasswordController.text);

    return nameError.value == null &&
        emailError.value == null &&
        passwordError.value == null &&
        confirmPasswordError.value == null;
  }

/*  void submit() {
    if (!validateForm()) return;

    // Yaha actual signup logic call karna
    print("Validation Passed ");
  }*/

  Future<void> submit() async {
    if (!validateForm()) return;
    try {
      final response = await supabase.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        data: {
          'full_name': fullNameController.text.trim(),
        },
      );
      if (response.user != null) {
        Get.showSuccess("Account created successfully 🎉");
        Get.offAllNamed(AppRoutes.loginScreen);
      } else {
        Get.showError("Something went wrong");
      }
    } on AuthException catch (e) {
      Get.showError(e.message);
    } catch (e) {
      Get.showError("Something went wrong");
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}