
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/appStyles.dart';
import '../../../../utils/widget/custom_button.dart';
import '../../../Custom_Widgets/CustomTextFeild.dart';
import '../../../Custom_Widgets/Custom_Button.dart';
import '../../../SubscriptionsScreens/Presentation/views/widgets/custom_appbar.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

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
      appBar: const CustomAppBar(title: "تغيير كلمة المرور"),
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
                      AppTextStyles.text14.copyWith(color: const Color(0xffA4ACAD)),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 3.h),
              CustomTextFormField(
                  name: 'forgetPassword',
                  controller: forgetPasswordController,
                  validators: [
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'حقل رقم الهاتف أو البريد الإلكتروني مطلوب';
                      }
                      // التحقق من تنسيق البريد الإلكتروني
                      if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$')
                          .hasMatch(value)) {
                        return null; // بريد إلكتروني صالح
                      }
                      // التحقق من تنسيق رقم الهاتف (10 أرقام كمثال)
                      if (RegExp(r'^\d{10}$').hasMatch(value)) {
                        return null; // رقم هاتف صالح
                      }
                      return 'يرجى إدخال بريد إلكتروني صالح أو رقم هاتف مكون من 10 أرقام';
                    },
                  ]),
              const Spacer(flex: 1),
              CustomButton(
                  title: "تأكيد",
                  onPressed: () {
                    context.push("/otp");
                  }),
              SizedBox(height: 3.h)
            ],
          ),
        ),
      ),
    );
  }
}
