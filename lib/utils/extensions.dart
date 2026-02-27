/*
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

/// @Created by akash on 08-12-2025.
/// Know more about author at https://akash.cloudemy.in

extension ContextExtensions on BuildContext {
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textStyle => theme.textTheme;
}

extension LaunchExtensions on String {
  /// 📞 Call Phone
  Future<void> call() async {
    final uri = Uri.parse("tel:$this");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  /// ✉️ Send Email
  Future<void> openEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: this,
    );
    if (!await launchUrl(uri)) {
      debugPrint("Could not launch $uri");
    }
  }

  /// Open URL
  Future<void> openUrl() async {
    final uri = Uri.parse(trim());
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $this");
    }
  }

  Future<void> openWhatsApp({String? message}) async {
    final phone = replaceAll(RegExp(r'[^\d]'), '');

    final uri = Uri.parse(
      "https://wa.me/$phone${message != null ? '?text=${Uri.encodeComponent(message)}' : ''}",
    );
    try {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      debugPrint("Could not launch WhatsApp for $phone");
    }
  }

  /// 💬 Send SMS
  Future<void> sms({String? message}) async {
    final uri = Uri.parse("sms:$this${message != null ? '?body=${Uri.encodeComponent(message)}' : ''}");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint("Could not launch $uri");
    }
  }

}*/
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
extension ContextExtensions on BuildContext {
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textStyle => theme.textTheme;
}
