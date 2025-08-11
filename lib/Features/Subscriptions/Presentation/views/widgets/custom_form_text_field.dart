import 'package:esay_app/core/utils/appColors.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

Widget CustomFormTextField({
  required String name,
  bool? obscure,
  final Icon? suffix,
  String? labelText,
  required TextEditingController controller,
  String? hintText,
  TextInputType? keyboardType,
  List<String? Function(String?)>? validators,
  bool showSpace = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (showSpace) ...[
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            labelText ?? "",
            style: AppTextStyles.text16.copyWith(
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: FormBuilderTextField(
          cursorColor: AppColors.primary,
          textAlign: TextAlign.right,
          name: name,
          obscureText: obscure ?? false,
          controller: controller,
          validator: FormBuilderValidators.compose(validators ?? []),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffix,
            hintTextDirection: TextDirection.ltr,
            hintText: hintText,
            hintStyle: AppTextStyles.text16.copyWith(
              fontSize: 14,
              color: const Color(0xffA4ACAD),
            ),
            filled: true,
            fillColor: const Color(0xffF9FAFA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Color(0xffE6E9EA)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: Color(0xffE6E9EA)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          ),
        ),
      ),
    ],
  );
}
