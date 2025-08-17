import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/signup_controller.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // الخلفية
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF002A4C),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 22, 40, 0.0001),
                    Color(0xFF002B4F),
                  ],
                  stops: [0.3642, 0.6276],
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // طبقة تلوين موحّدة بنفس درجة Splash
            Container(color: const Color(0x880A2239)),

            // المحتوى
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 18),
                      Image.asset(
                        'assets/images/eazy_logo.png',
                        width: 220,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'تسجيل حساب جديد',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // اسم المستخدم
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'اسم المستخدم',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // رقم الهاتف أو البريد
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'رقم الهاتف / البريد الإلكتروني',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // كلمة المرور
                      TextField(
                        obscureText: !controller.passwordVisible1,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'كلمة المرور',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          prefixIcon: IconButton(
                            icon: Icon(
                              controller.passwordVisible1 ? Icons.visibility : Icons.visibility_off,
                              color: const Color(0xFF4A6FA5),
                            ),
                            onPressed: controller.togglePassword1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),

                      // إعادة كلمة المرور
                      TextField(
                        obscureText: !controller.passwordVisible2,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'أعد إدخال كلمة المرور',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          prefixIcon: IconButton(
                            icon: Icon(
                              controller.passwordVisible2 ? Icons.visibility : Icons.visibility_off,
                              color: const Color(0xFF4A6FA5),
                            ),
                            onPressed: controller.togglePassword2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // الموافقة على الشروط (محاذاة يمين + تلوين أجزاء النص)
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Checkbox على اليمين مرتبط بالحالة
                          Checkbox(
                            value: controller.agreeTerms,
                            onChanged: controller.toggleAgree,
                            side: const BorderSide(color: Colors.white),
                            activeColor: const Color(0xFF4A6FA5),
                            checkColor: Colors.white,
                          ),
                          const SizedBox(width: 6),
                          // الجملة كاملة بعد المربع: "أوافق على الشروط والأحكام والاستمرار"
                          Flexible(
                            child: GestureDetector(
                              onTap: () => controller.toggleAgree(null),
                              child: RichText(
                                textAlign: TextAlign.right,
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                  children: [
                                    TextSpan(text: 'أوافق على '),
                                    TextSpan(
                                      text: 'الشروط والأحكام والاستمرار',
                                      style: TextStyle(
                                        color: Color(0xFF4A6FA5),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // زر التسجيل
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A6FA5),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: controller.onSignup,
                          child: const Text(
                            'إنشاء حساب',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),

                      // تسجيل الدخول
                      GestureDetector(
                        onTap: controller.onLogin,
                        child: const Center(
                          child: Text(
                            'لديك حساب بالفعل؟ تسجيل الدخول',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Cairo',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
