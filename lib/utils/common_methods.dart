

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import 'extensions.dart';

void showErrorDialog(
  String error, {
  String? msg,
  String positiveButtonName = 'OK',
  VoidCallback? onClose,
  VoidCallback? onAction,
}) {
  final context = Get.context;
  Get.defaultDialog(
    contentPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
    titlePadding: const EdgeInsets.only(top: 16, bottom: 8),
    title: 'Message',
    titleStyle: TextStyle(
      color: Colors.red[800],
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    middleText: msg != null ? '$error\n$msg' : error,
    textConfirm: onAction == null ? null : positiveButtonName,
    textCancel: onAction == null ? "OK" : 'Cancel',
    // cancelTextColor: context?.colorScheme.primary,
    // buttonColor: context?.colorScheme.primary,
    confirmTextColor: Colors.white,
    onConfirm: onAction == null
        ? null
        : () {
            Get.back();
            onAction.call();
          },
    onCancel: () {
      onClose?.call();
    },
  );
}

void showSuccessDialog(
  String data, {
  String? msg,
  String? buttonName,
  VoidCallback? onClose,
}) {
  Get.defaultDialog(
    barrierDismissible: onClose != null,
    contentPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
    titlePadding: const EdgeInsets.only(top: 16, bottom: 8),
    title: 'Message',
    titleStyle: TextStyle(
      color: Colors.green[800],
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    middleText: msg != null ? '$data\n$msg' : data,
    textConfirm: buttonName ?? '       OK       ',
    // buttonColor: Get.context?.colorScheme.primary,
    confirmTextColor: Colors.white,
    onConfirm: () {
      Get.back();
      onClose?.call();
    },
  );
}
String getErrorMsg(dynamic obj) {
  if (obj is GetHttpException) {
    return obj.message;
  } else if (obj is SocketException || obj is TimeoutException) {
    return "No internet connection or request timed out";
  } else if (obj is Response) {
    final status = obj.status;

    if (status.connectionError) {
      return "No internet connection";
    } else if (status.isUnauthorized) {
      return obj.statusText ?? "Unauthorized";
    } else if (status.isNotFound) {
      return "404 : Resource not found";
    } else if (status.isServerError) {
      return "${status.code} : Server error. Please try again later.";
    }
    try {
      return obj.body?["responseText"] ??
          obj.body?["message"] ??
          "${obj.statusCode ?? 'Unknown status'}\n${obj.statusText ?? ''}";
    } catch (e) {
      return "Some thing went wrong";
    }
  }

  return obj.toString() as String? ?? "Some thing went wrong";
}


void showErrorSnackBar(String msg) {
  try {
    if (Get.isSnackbarOpen == true) {
      Get.closeAllSnackbars();
    }
    Get.snackbar(
      "Error".tr,
      msg, // message
      snackPosition: SnackPosition.TOP,
      backgroundColor: Get.context?.colorScheme.errorContainer,
      colorText: Get.context?.colorScheme.onErrorContainer,
      borderRadius: 4,
    );
  } catch (e) {
    debugPrint("exception--${e.toString()}");
  }
}

void showSuccessSnackBar(String msg) {
  try {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.snackbar(
      "Success", // title
      msg, // message
      snackPosition: SnackPosition.TOP,
      backgroundColor: Get.context?.colorScheme.onTertiaryFixed,
      colorText: Get.context?.colorScheme.tertiaryFixed,
      borderRadius: 4,
    );
  } catch (e) {
    debugPrint("exception--${e.toString()}");
  }
}
