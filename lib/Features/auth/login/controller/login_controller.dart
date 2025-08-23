import 'package:get/get.dart';

import '../../otp/view/otp_view.dart';
import '../../signup/view/signup_view.dart';

class LoginController extends GetxController {
  bool passwordVisible = false;
  String email = '';

  void onEmailChanged(String value) {
    email = value;
    update();
  }

  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
    update();
  }

  void onLogin() async {
    // منطق وهمي لإرسال الكود
    if (email.isEmpty) {
      Get.snackbar('خطأ', 'يرجى إدخال البريد الإلكتروني أولاً');
      return;
    }
    Get.snackbar('تم الإرسال', 'تم إرسال كود التحقق إلى $email\n(الكود هو 5555)');
    await Future.delayed(const Duration(seconds: 1));
    Get.to(() => const OtpView());
  }

  void onForgotPassword() {
    // TODO: تنفيذ استرجاع كلمة المرور
  }

  void onSignUp() {
    Get.to(() => const SignupView());
  }
}
