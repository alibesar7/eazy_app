import 'package:esay_app/Features/PersonalData/Presentation/widgets/custom_circle_avatar.dart';
import 'package:esay_app/Features/PersonalData/Presentation/widgets/custom_modal_bottom_sheet.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_appbar.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_form_text_field.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_row.dart';
import 'package:esay_app/core/utils/appColors.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/app_assets.dart';
import 'package:esay_app/core/utils/widgets/custom_alert_dialog.dart';
import 'package:esay_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class PersonalDetailsView extends StatelessWidget {
  PersonalDetailsView({super.key});
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "البيانات الشخصية"),
      body: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Center(
                  child: SizedBox(
                height: 115,
                width: 115,
                child: CustomCircleAvatar(),
              )),
              SizedBox(height: 2.h),
              CustomFormTextField(
                  name: "اسم المستخدم",
                  controller: userNameController,
                  hintText: "اسم المستخدم",
                  showSpace: false,
                  validators: [
                    FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'حقل البريد مطلوب'),
                      FormBuilderValidators.email(
                          errorText: 'يرجى إدخال بريد إلكتروني صحيح'),
                    ]),
                  ]),
              SizedBox(height: 1.h),
              CustomFormTextField(
                name: "رقم الهاتف",
                controller: userNameController,
                hintText: "رقم الهاتف",
                keyboardType: TextInputType.phone,
                validators: [
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(11,
                      errorText: 'يجب أن يكون الرقم 11 أرقام'),
                  FormBuilderValidators.maxLength(11,
                      errorText: 'يجب أن يكون الرقم 11 أرقام'),
                ],
                showSpace: false,
              ),
              SizedBox(height: 1.h),
              CustomFormTextField(
                  name: "البريد الالكتروني",
                  controller: userNameController,
                  hintText: "البريد الالكتروني",
                  showSpace: false,
                  keyboardType: TextInputType.emailAddress,
                  validators: [
                    FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'حقل البريد مطلوب'),
                      FormBuilderValidators.email(
                          errorText: 'يرجى إدخال بريد إلكتروني صحيح'),
                    ]),
                  ]),
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
                        "    تغيير كلمة المرور  ",
                        style: AppTextStyles.text14
                            .copyWith(color: Color(0xffA4ACAD)),
                      ),
                    ),
                    Image.asset(
                      Assets.assetsIconsPadlock3,
                      color: Colors.grey.withOpacity(.5),
                    )
                  ],
                ),
              ),
              Spacer(flex: 1),
              CustomButton(
                title: "حفظ التعديلات",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomAlertDialog(
                          title: "تم حفظ التعديلات بنجاح",
                          widget1: Image.asset(Assets.assetsIconsMobilePay),
                          widget2: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff2A72AD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("تم",
                                style: AppTextStyles.text14
                                    .copyWith(color: Colors.white)),
                          ),
                        );
                      });
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    builder: (BuildContext context) {
                      return CustomModalBottomSheet();
                    },
                  );
                },
                child: CustomRow(
                    padding: EdgeInsets.only(bottom: 10),
                    mainAxisAlignmen: MainAxisAlignment.center,
                    text: "حذف الحساب",
                    textStyle:
                        AppTextStyles.text14.copyWith(color: Color(0xffFF0000)),
                    image: Image.asset(Assets.assetsIconsDet)),
              ),
              SizedBox(
                height: 2.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
