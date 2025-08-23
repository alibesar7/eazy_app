import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../utils/appAssets.dart';
import '../../../../utils/appStyles.dart';
import '../../../../utils/widget/custom_alert_dialog.dart';
import '../../../../utils/widget/custom_button.dart';
import '../../../Custom_Widgets/CustomTextFeild.dart';
import '../../../SubscriptionsScreens/Presentation/views/widgets/custom_appbar.dart';
import '../../../SubscriptionsScreens/Presentation/views/widgets/custom_form_text_field.dart';
import '../../../SubscriptionsScreens/Presentation/views/widgets/custom_row.dart';
import '../widgets/custom_circle_avatar.dart';
import '../widgets/custom_modal_bottom_sheet.dart';

class PersonalDetailsView extends StatelessWidget {
  PersonalDetailsView({super.key});

  // Controllers منفصلة لكل حقل
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "البيانات الشخصية"),
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const Center(
                child: SizedBox(
                  height: 115,
                  width: 115,
                  child: CustomCircleAvatar(),
                ),
              ),
              SizedBox(height: 2.h),

              // اسم المستخدم
              CustomTextFormField(
                name: "username",
                controller: userNameController,
                hintText: "اسم المستخدم",
                showSpace: false,
                validators: [
                  FormBuilderValidators.required(
                    errorText: 'حقل اسم المستخدم مطلوب',
                  ),
                ],
              ),
              SizedBox(height: 1.h),

              // رقم الهاتف
              CustomFormTextField(
                name: "phone",
                controller: phoneNumberController,
                hintText: "رقم الهاتف",
                keyboardType: TextInputType.phone,
                validators: [
                  FormBuilderValidators.required(errorText: 'حقل رقم الهاتف مطلوب'),
                  FormBuilderValidators.minLength(11, errorText: 'يجب أن يكون الرقم 11 أرقام'),
                  FormBuilderValidators.maxLength(11, errorText: 'يجب أن يكون الرقم 11 أرقام'),
                ],
                showSpace: false,
              ),
              SizedBox(height: 1.h),

              // البريد الإلكتروني
              CustomFormTextField(
                name: "email",
                controller: emailController,
                hintText: "البريد الإلكتروني",
                keyboardType: TextInputType.emailAddress,
                showSpace: false,
                validators: [
                  FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'حقل البريد مطلوب',
                    ),
                    FormBuilderValidators.email(
                      errorText: 'يرجى إدخال بريد إلكتروني صحيح',
                    ),
                  ]),
                ],
              ),
              SizedBox(height: 1.h),

              // تغيير كلمة المرور
              InkWell(
                onTap: () {
                  context.push("/resetPassword");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "تغيير كلمة المرور",
                        style: AppTextStyles.text14.copyWith(color: const Color(0xffA4ACAD)),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Image.asset(
                      AppAssets.assetsIconsPadlock3,
                      color: Colors.grey.withOpacity(.5),
                    )
                  ],
                ),
              ),
              const Spacer(flex: 1),

              // زر حفظ التعديلات
              CustomButton(
                title: "حفظ التعديلات",
                onPressed: () {
                  if (formKey.currentState?.saveAndValidate() ?? false) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          title: "تم حفظ التعديلات بنجاح",
                          widget1: Image.asset(AppAssets.assetsIconsMobilePay),
                          widget2: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff2A72AD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "تم",
                              style: AppTextStyles.text14.copyWith(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              SizedBox(height: 1.h),

              // حذف الحساب
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    builder: (BuildContext context) {
                      return const CustomModalBottomSheet();
                    },
                  );
                },
                child: CustomRow(
                  padding: const EdgeInsets.only(bottom: 10),
                  mainAxisAlignmen: MainAxisAlignment.center,
                  text: "حذف الحساب",
                  textStyle: AppTextStyles.text14.copyWith(color: const Color(0xffFF0000)),
                  image: Image.asset(AppAssets.assetsIconsDet),
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
