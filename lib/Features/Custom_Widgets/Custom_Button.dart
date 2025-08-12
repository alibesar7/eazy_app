import 'package:esay_app/utils/appColors.dart';
import 'package:esay_app/utils/appStyles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onButtonClick;
  final String text;
  final TextStyle? textStyle;

  const CustomElevatedButton({
    Key? key,
    required this.onButtonClick,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onButtonClick,
      child: Text(
        text,
        style: textStyle ?? AppTextStyles.caption,
      ),
    );
  }
}
