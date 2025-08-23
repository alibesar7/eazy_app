import 'package:get/get.dart';

class SignupController extends GetxController {
  bool agreeTerms = false;
  bool passwordVisible1 = false;
  bool passwordVisible2 = false;

  void toggleAgree(bool? value) {
    agreeTerms = value ?? !agreeTerms;
    update();
  }

  void togglePassword1() {
    passwordVisible1 = !passwordVisible1;
    update();
  }

  void togglePassword2() {
    passwordVisible2 = !passwordVisible2;
    update();
  }

  void onSignup() {
    // TODO: تنفيذ إنشاء الحساب
  }

  void onLogin() {
    // TODO: الانتقال لشاشة تسجيل الدخول
  }
}
