 import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sizer/sizer.dart';

import '../payment_view.dart';
import 'custom_form_text_field.dart';

class CustomDataCard extends StatelessWidget {
  const CustomDataCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: const Color(0xffF9F9F9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFormTextField(
                showSpace: true,
                name: "رقم البطاقة",
                labelText: "*رقم البطاقة",
                controller: cardNumberController,
                hintText: "XXXX - XXXX - XXXX - XXXX",
                keyboardType: TextInputType.number,
                validators: [
                  FormBuilderValidators.required(errorText: 'هذا الحقل مطلوب'),
                  FormBuilderValidators.creditCard(
                      errorText: 'رقم البطاقة غير صالح'),
                ]),
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomFormTextField(
                      showSpace: true,
                      name: "رمز الأمان",
                      labelText: "رمز الأمان",
                      controller: cvvCodeController,
                      hintText: "***",
                      obscure: true,
                      keyboardType: TextInputType.number,
                      validators: [
                        FormBuilderValidators.required(errorText: 'مطلوب'),
                        FormBuilderValidators.minLength(3,
                            errorText: 'يجب أن يكون 3 أرقام'),
                        FormBuilderValidators.maxLength(4,
                            errorText: 'يجب أن يكون 4 أرقام'),
                      ]),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomFormTextField(
                      showSpace: true,
                      name: 'تاريخ الانتهاء',
                      labelText: "تاريخ الانتهاء",
                      controller: expDateController,
                      hintText: "شهر / سنة",
                      keyboardType: TextInputType.datetime,
                      validators: [
                        FormBuilderValidators.required(errorText: 'مطلوب')
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            CustomFormTextField(
                showSpace: true,
                name: "رمز حامل البطاقة",
                labelText: "إسم حامل البطاقة*",
                controller: cardHolderNameController,
                hintText: "أدخل اسم حامل البطاقة",
                keyboardType: TextInputType.name,
                validators: [
                  FormBuilderValidators.required(errorText: 'هذا الحقل مطلوب'),
                ]),
            SizedBox(
              height: 1.5.h,
            ),
          ],
        ),
      ),
    );
  }
}
