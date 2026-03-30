import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  Future<void> startSplash(VoidCallback onComplete) async {
    await Future.delayed(const Duration(seconds: 3));
    onComplete();
  }
}
