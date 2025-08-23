import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/otp_controller.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      init: OtpController(),
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 32),
                    const Text(
                      'كود التحقق',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () => controller.onBack(),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'من فضلك ادخل رمز التحقق الذي أرسل لك في رسالة\nعلى رقم: +218 *** *** **21',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF9AA0A6),
                    fontSize: 13,
                    fontFamily: 'Cairo',
                  ),
                ),
                const SizedBox(height: 32),
                // حقل إدخال الكود
                if (!controller.isError)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.otpLength, (i) {
                      return Container(
                        width: 56,
                        height: 56,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xFF4A6FA5),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          i < controller.otpCode.length ? controller.otpCode[i] : '',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      );
                    }),
                  ),
                // حقل الخطأ
                if (controller.isError)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(controller.otpLength, (i) {
                          return Container(
                            width: 56,
                            height: 56,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xFFD32F2F),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              '—',
                              style: TextStyle(
                                color: Color(0xFFD32F2F),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline, color: Color(0xFFD32F2F), size: 18),
                          SizedBox(width: 4),
                          Text('هذا الحقل مطلوب', style: TextStyle(color: Color(0xFFD32F2F), fontSize: 13, fontFamily: 'Cairo')),
                        ],
                      ),
                    ],
                  ),
                const SizedBox(height: 32),
                // حقل إدخال فعلي (مخفي)
                Opacity(
                  opacity: 0.0,
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    maxLength: controller.otpLength,
                    onChanged: controller.onOtpChanged,
                    decoration: const InputDecoration(counterText: ''),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A6FA5),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: controller.otpCode.length == controller.otpLength && controller.timer == 0 ? controller.onConfirm : null,
                    child: const Text(
                      'تأكيد',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
                if (controller.isError && controller.timer > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Center(
                      child: Text(
                        'حاول مرة أخرى بعد ${controller.timer} ثانية',
                        style: const TextStyle(
                          color: Color(0xFF9AA0A6),
                          fontSize: 13,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),
                if (controller.isError && controller.timer == 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Center(
                      child: TextButton(
                        onPressed: controller.onResendCode,
                        child: const Text(
                          'إعادة إرسال الرمز',
                          style: TextStyle(
                            color: Color(0xFF4A6FA5),
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpInputRow extends StatelessWidget {
  final bool isError;
  const OtpInputRow({super.key, this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Container(
          width: 56,
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: isError ? const Color(0xFFD32F2F) : const Color(0xFF4A6FA5),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            isError ? '—' : '5',
            style: TextStyle(
              color: isError ? const Color(0xFFD32F2F) : Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo',
            ),
          ),
        );
      }),
    );
  }
}
