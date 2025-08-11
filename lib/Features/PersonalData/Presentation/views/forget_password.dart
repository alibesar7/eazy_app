import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_appbar.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_form_text_field.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final forgetPasswordController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    super.dispose();
    forgetPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "تغيير كلمة المرور"),
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "ادخل رقم الهاتف / البريد الالكتروني لاستعادة\n    كلمة المرور",
                  style:
                      AppTextStyles.text14.copyWith(color: Color(0xffA4ACAD)),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 3.h),
              CustomFormTextField(
                  name: 'forgetPassword', controller: forgetPasswordController),
              Spacer(flex: 1),
              CustomButton(title: "تأكيد", onPressed: () {}),
              SizedBox(height: 3.h)
            ],
          ),
        ),
      ),
    );
  }
}
