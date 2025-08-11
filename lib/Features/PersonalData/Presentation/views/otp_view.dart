import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_appbar.dart';
import 'package:esay_app/core/utils/appColors.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // --- ثيمات مخصصة لكل حالة من حالات الحقل ---

    // المظهر الافتراضي (الحقل الفارغ)
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200, // لون الخلفية
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    // المظهر عند التركيز على الحقل (Focus)
    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.blueAccent), // لون الإطار
      ),
    );

    // المظهر بعد إدخال الرقم في الحقل
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.blue), // لون الإطار
      ),
    );

    return Scaffold(
      appBar: CustomAppBar(title: "كود التحقق"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 1.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "من فضلك أدخل رمز التحقق الذي أرسل لك في رسالةعلى رقم  ",
                style: AppTextStyles.text14.copyWith(color: Color(0xffA4ACAD)),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: 5.h),
            Center(
              child: Pinput(
                length: 4, // عدد خانات الرمز
                controller: pinController,
                focusNode: focusNode,

                // تطبيق الثيمات التي أنشأناها
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,

                // يمكنك إضافة separator بين الخانات إذا أردت
                // separatorBuilder: (index) => const SizedBox(width: 8),

                onCompleted: (pin) {
                  // هذه الدالة تُستدعى عند تعبئة كل الخانات
                  debugPrint('onCompleted: $pin');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('الرمز المكتمل: $pin')),
                  );
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },

                // شكل مؤشر الكتابة (Cursor)
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(flex: 1),
            CustomButton(title: "تأكيد ", onPressed: () {}),
            SizedBox(height: 2.h),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("00:55",
                    style: AppTextStyles.text14
                        .copyWith(color: AppColors.primary)),
                Text(
                  "  حاول مرة أخرى بعد",
                  style:
                      AppTextStyles.text14.copyWith(color: Color(0xffA4ACAD)),
                )
              ],
            )),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
