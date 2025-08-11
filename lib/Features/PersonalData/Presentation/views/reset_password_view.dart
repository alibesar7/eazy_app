import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_appbar.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_form_text_field.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordAgainController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "تغيير كلمة المرور"),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: FormBuilder(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                CustomFormTextField(
                    suffix: const Icon(
                      Icons.remove_red_eye,
                      color: Color(0xffc9cecf),
                    ),
                    showSpace: false,
                    hintText: "كلمة المرور القديمة",
                    name: '',
                    controller: oldPasswordController),
                CustomFormTextField(
                    suffix: const Icon(
                      Icons.remove_red_eye,
                      color: Color(0xffc9cecf),
                    ),
                    showSpace: false,
                    hintText: "كلمة المرور الجديدة",
                    name: '',
                    controller: newPasswordController),
                CustomFormTextField(
                  suffix: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xffc9cecf),
                  ),
                  showSpace: false,
                  hintText: "أعد إدخال كلمة المرور الجديدة",
                  name: '',
                  controller: newPasswordAgainController,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "نسيت كلمة المرور؟ ",
                      style: AppTextStyles.text14
                          .copyWith(color: Color(0xffA4ACAD)),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(title: "حفظ التعديلات",onPressed: (){},),
                ),
                SizedBox(
                  height: 1.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
