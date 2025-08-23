
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/appStyles.dart';
import '../../../../utils/widget/custom_button.dart';
import '../../../SubscriptionsScreens/Presentation/views/widgets/custom_appbar.dart';
import '../../../SubscriptionsScreens/Presentation/views/widgets/custom_form_text_field.dart';

class UpdatePasswordView extends StatefulWidget {
  const UpdatePasswordView({super.key});

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
      appBar: const CustomAppBar(title: "أعد تعيين كلمة المرور"),
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
                        AppTextStyles.text14.copyWith(color: const Color(0xffA4ACAD)),
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
                    name: 'password',
                    validators: [
                      FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'حقل كلمة المرور مطلوب'),
                        FormBuilderValidators.minLength(8,
                            errorText:
                                'يجب أن تكون كلمة المرور 8 أحرف على الأقل'),
                        FormBuilderValidators.match(
                            RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])'),
                            errorText:
                                'يجب أن تحتوي كلمة المرور على أحرف كبيرة، صغيرة، وأرقام'),
                      ]),
                    ],
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
                    validators: [
                      FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'حقل التأكيد مطلوب'),
                        (value) {
                          if (value !=
                              formKey.currentState?.fields['password']?.value) {
                            return 'كلمات المرور غير متطابقة';
                          }
                          return null;
                        },
                      ]),
                    ]),
                const Spacer(flex: 1),
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
