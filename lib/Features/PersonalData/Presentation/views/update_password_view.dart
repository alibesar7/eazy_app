import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_appbar.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_form_text_field.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sizer/sizer.dart';

class UpdatePasswordView extends StatefulWidget {
  UpdatePasswordView({super.key});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
  final newPasswordController = TextEditingController();

  final newPasswordAgainController = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();

  @override
  void dispose() {
    super.dispose();
    newPasswordController.dispose();
    newPasswordAgainController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "أعد تعيين كلمة المرور"),
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                SizedBox(height: 1.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "من فضلك أدخل كلمة المرور الجديدة وقم بتأكيد\n كلمة المرور",
                    style:
                        AppTextStyles.text14.copyWith(color: Color(0xffA4ACAD)),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: 3.h),
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
                Spacer(flex: 1),
                CustomButton(title: "تحديث كلمة المرور", onPressed: () {}),
                SizedBox(height: 3.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
