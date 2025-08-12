import 'package:esay_app/Features/PersonalData/Presentation/widgets/bottom_widget.dart';
import 'package:esay_app/Features/PersonalData/Presentation/widgets/custom_pin_put.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_appbar.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    final defaultPinTheme = PinTheme(
      width: 78,
      height: 74,
      textStyle: AppTextStyles.numberText,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.blueAccent),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.white,
        border: Border.all(color: Colors.blue),
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
              child: CustomPinPutWidget(
                  pinController: pinController,
                  focusNode: focusNode,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme),
            ),
            Spacer(flex: 1),
            CustomButton(
                title: "تأكيد ",
                onPressed: () {
                  context.push("/updatePassword");
                }),
            SizedBox(height: 2.h),
            bottomWidget(),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
