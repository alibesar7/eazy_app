
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/appStyles.dart';
import '../../../../utils/widget/custom_button.dart';
import '../../../SubscriptionsScreens/Presentation/views/widgets/custom_appbar.dart';
import '../../../SubscriptionsScreens/Presentation/views/widgets/custom_form_text_field.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordAgainController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "تغيير كلمة المرور"),
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
                    controller: oldPasswordController,
                    validators: [
                      FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: 'حقل كلمة المرور القديمة مطلوب'),
                        FormBuilderValidators.minLength(8,
                            errorText:
                                'يجب أن تكون كلمة المرور 8 أحرف على الأقل'),
                      ]),
                    ]),
                CustomFormTextField(
                  suffix: const Icon(
                    Icons.remove_red_eye,
                    color: Color(0xffc9cecf),
                  ),
                  showSpace: false,
                  hintText: "كلمة المرور الجديدة",
                  name: 'new_password',
                  controller: newPasswordController,
                  validators: [
                    FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'حقل كلمة المرور الجديدة مطلوب'),
                      FormBuilderValidators.minLength(8,
                          errorText:
                              'يجب أن تكون كلمة المرور 8 أحرف على الأقل'),
                      FormBuilderValidators.match(
                          RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])'),
                          errorText:
                              'يجب أن تحتوي كلمة المرور على أحرف كبيرة، صغيرة، وأرقام'),
                    ]),
                  ],
                ),
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
                            formKey
                                .currentState?.fields['new_password']?.value) {
                          return 'كلمات المرور الجديدة غير متطابقة';
                        }
                        return null;
                      },
                    ]),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      context.push("/forgetPassword");
                    },
                    child: Text(
                      "نسيت كلمة المرور؟ ",
                      style: AppTextStyles.text14
                          .copyWith(color: const Color(0xffA4ACAD)),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    title: "حفظ التعديلات",
                    onPressed: () {},
                  ),
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
