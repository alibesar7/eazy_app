import 'package:get/get.dart';

import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../reset_password/view/reset_password_view.dart';

class OtpController extends GetxController {
  bool isError = false;
  int timer = 0;
  String otpCode = '';
  final int otpLength = 4;
  Timer? _countdownTimer;

  void onBack() {
    Get.back();
  }

  void onOtpChanged(String value) {
    otpCode = value;
    update();
  }

  void onConfirm() {
    // مثال: الكود الصحيح "5555"
    if (otpCode == '5555') {
      isError = false;
      timer = 0;
      update();
      // انتقل لشاشة تعيين كلمة المرور الجديدة
      Get.off(() => const ResetPasswordView());
    } else {
      isError = true;
      startTimer();
      update();
    }
  }

  void startTimer() {
    timer = 55;
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timer > 0) {
        timer--;
        update();
      } else {
        _countdownTimer?.cancel();
        update();
      }
    });
  }

  void onResendCode() {
    if (timer == 0) {
      isError = false;
      otpCode = '';
      update();
      // يمكنك هنا تنفيذ منطق إعادة إرسال الكود
    }
  }

  @override
  void onClose() {
    _countdownTimer?.cancel();
    super.onClose();
  }
}
