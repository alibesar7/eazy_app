import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_appbar.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_form_text_field.dart';
import 'package:esay_app/Features/Subscriptions/Presentation/views/widgets/custom_row.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:esay_app/core/utils/app_assets.dart';
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
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Stack(children: [
                    Image.asset(
                      Assets.assetsIconsOval,
                      height: 115,
                      width: 115,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        right: 5,
                        bottom: 5,
                        child: InkWell(
                          onTap: () {
                            context.push("/upgrade");
                          },
                          child: Container(
                              height: 25,
                              width: 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(23),
                                  color: Colors.white),
                              child: Image.asset(Assets.assetsIconsCamera)),
                        ))
                  ]),
                ),
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
                onTap: () {},
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
                onPressed: () {},
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {},
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
