import 'package:esay_app/core/utils/appColors.dart';
import 'package:esay_app/core/utils/appStyles.dart';
import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onButtonClick;
  final String text;

  const CustomElevatedButton({
    Key? key,
    required this.onButtonClick,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),),
      onPressed: onButtonClick,
      child: Text(text,style:  AppTextStyles.caption,),
    );
  }
}