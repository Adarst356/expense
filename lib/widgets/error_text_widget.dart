
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'app_button.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    super.key,
    required this.msg,
    this.onRetry,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.broken = false,
    this.bottomBar = false,
    this.asset = 'assets/json/Error.json',
  });

  final MainAxisSize mainAxisSize;
  final String msg;
  final String asset;
  final VoidCallback? onRetry;
  final bool broken;
  final bool bottomBar;

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: [
        Lottie.asset(height: 200.0, width: 200.0, asset, fit: BoxFit.fill),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              msg.tr,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        if (onRetry != null)
          Container(
            padding: const EdgeInsets.only(top: 16.0,bottom: 16),
            width: 150,
            child: AppButton(onPressed: onRetry, text: "Retry"),
          ),
      ],
    );
  }
}


