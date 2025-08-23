import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../login/view/login_view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  bool passwordVisible1 = false;
  bool passwordVisible2 = false;
  final TextEditingController pass1 = TextEditingController();
  final TextEditingController pass2 = TextEditingController();

  void showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Stack(
        children: [
          Positioned(
            top: 255,
            left: 27,
            child: Container(
              width: 339,
              height: 322,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, top: 16),
                      child: IconButton(
                        icon: const Icon(Icons.close, size: 24),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'تم حفظ التغييرات بنجاح',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 51,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A6FA5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 48),
                        ),
                        onPressed: navigateToLoginWithDialog,
                        child: const Text(
                          'انتقل للصفحة الرئيسية',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToLoginWithDialog() {
    // انتقل إلى شاشة تسجيل الدخول ثم اعرض نفس مربع النجاح فوقها
    Get.offAll(() => const LoginView());
    Future.delayed(const Duration(milliseconds: 120), () {
      Get.dialog(
        Stack(
          children: [
            Positioned(
              top: 255,
              left: 27,
              child: Container(
                width: 339,
                height: 322,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16),
                        child: IconButton(
                          icon: const Icon(Icons.close, size: 24),
                          onPressed: () => Get.back(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'تم حفظ التغييرات بنجاح',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: 339 - 24 * 2,
                        height: 51,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A6FA5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 48),
                          ),
                          onPressed: () => Get.back(),
                          child: const Text(
                            'انتقل للصفحة الرئيسية',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 32),
                      const Text(
                        'أعد تعيين كلمة المرور',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'من فضلك أدخل كلمة المرور الجديدة وقم بتأكيد كلمة المرور',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF9AA0A6),
                      fontSize: 13,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 291,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: const Color(0xFFD2D2D2), width: 1.25),
                          ),
                          child: TextField(
                            controller: pass1,
                            obscureText: !passwordVisible1,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: 'كلمة المرور الجديدة',
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 16),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  passwordVisible1
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color(0xFF4A6FA5),
                                ),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible1 = !passwordVisible1;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: const Color(0xFFD2D2D2), width: 1.25),
                          ),
                          child: TextField(
                            controller: pass2,
                            obscureText: !passwordVisible2,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: 'أعد إدخال كلمة المرور الجديدة',
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 16),
                              prefixIcon: IconButton(
                                icon: Icon(
                                  passwordVisible2
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color(0xFF4A6FA5),
                                ),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible2 = !passwordVisible2;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 340,
                    height: 51,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A6FA5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 48),
                      ),
                      onPressed: showSuccessDialog,
                      child: const Text(
                        'تحديث كلمة المرور',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
