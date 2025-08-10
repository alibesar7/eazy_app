import 'package:esay_app/core/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

Widget CustomFormTextField({
  required String name,
  bool? obscure,
   String? labelText,
  required TextEditingController controller,
  String? hintText,
  TextInputType? keyboardType,
  List<String? Function(String?)>? validators,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          labelText?? "",
          style: AppTextStyles.text16.copyWith(
            fontSize: 14,
          ),
        ),
      ),
      const SizedBox(height: 12),
      FormBuilderTextField(
        textAlign: TextAlign.right,
        name: name,
        obscureText: obscure ?? false,
        controller: controller,
        validator: FormBuilderValidators.compose(validators ?? []),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintTextDirection: TextDirection.ltr,
          hintText: hintText,
          hintStyle: AppTextStyles.text16.copyWith(
            fontSize: 14,
            color: Color(0xffA4ACAD),
          ),
          filled: true,
          fillColor: Color(0xFFF9F9F9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Color(0xffE6E9EA)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Color(0xffE6E9EA)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Color(0xffE6E9EA), width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    ],
  );
}
