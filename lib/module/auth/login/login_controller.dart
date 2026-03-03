import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/toast_extension.dart';

class LoginController extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotMobileController = TextEditingController();
  final supabase = Supabase.instance.client;
  var isLoading = false.obs;
  var emailError = RxnString();
  var passwordError = RxnString();

  var obscureText = true.obs;

  void togglePassword() {
    obscureText.value = !obscureText.value;
  }
  Future<void> login() async {
    if (!validateForm()) return;

    try {
      isLoading.value = true;

      final response = await supabase.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response.user != null) {
        Get.showSuccess("Login Successful 🎉");

        Get.offAllNamed(AppRoutes.dashboard);
      }
    } on AuthException catch (e) {
      Get.showError(e.message);
    } catch (e) {
      Get.showError("Something went wrong");
    } finally {
      isLoading.value = false;
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

  bool validateForm() {
    validateEmail(emailController.text);
    validatePassword(passwordController.text);

    return emailError.value == null &&
        passwordError.value == null;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    forgotMobileController.dispose();
    super.onClose();
  }
}