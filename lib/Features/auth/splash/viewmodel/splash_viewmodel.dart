import 'dart:async';
import 'package:get/get.dart';

class SplashViewModel extends GetxController {
  void startSplashTimer() {
    Timer(const Duration(seconds: 5), () {
      Get.offAllNamed('/onboarding');
    });
  }
}