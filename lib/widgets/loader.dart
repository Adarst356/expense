import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        height: 100.0,
        width: 100.0,
        'assets/json/loading.json',
        fit: BoxFit.fill,
      ),
    );
  }
}

